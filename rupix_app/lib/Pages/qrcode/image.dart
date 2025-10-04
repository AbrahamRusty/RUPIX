import 'dart:async';
// ignore: unnecessary_import
import 'dart:typed_data';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

class ImageProcessor {
  /// Convert CameraImage to JPEG bytes for processing
  static Future<Uint8List> convertCameraImageToJpeg(CameraImage cameraImage) async {
    try {
      switch (cameraImage.format.group) {
        case ImageFormatGroup.yuv420:
          return await _convertYUV420ToJpeg(cameraImage);
        case ImageFormatGroup.bgra8888:
          return await _convertBGRA8888ToJpeg(cameraImage);
        case ImageFormatGroup.jpeg:
          return await _convertJPEGToJpeg(cameraImage);
        case ImageFormatGroup.nv21:
          return await _convertNV21ToJpeg(cameraImage);
        default:
          throw Exception('Unsupported image format: ${cameraImage.format.group}');
      }
    } catch (e) {
      debugPrint('Error converting camera image: $e');
      rethrow;
    }
  }

  /// Convert YUV420 to JPEG
  static Future<Uint8List> _convertYUV420ToJpeg(CameraImage cameraImage) async {
    final int width = cameraImage.width;
    final int height = cameraImage.height;
    
    // Get Y, U, V planes
    final yPlane = cameraImage.planes[0];
    final uPlane = cameraImage.planes[1];
    final vPlane = cameraImage.planes[2];
    
    // Create Image object
    final image = img.Image(width: width, height: height);
    
    // Convert YUV to RGB
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final yValue = yPlane.bytes[y * yPlane.bytesPerRow + x];
        final uvIndex = (y ~/ 2) * uPlane.bytesPerRow + (x ~/ 2) * 2;
        final uValue = uvIndex < uPlane.bytes.length ? uPlane.bytes[uvIndex] : 128;
        final vValue = uvIndex < vPlane.bytes.length ? vPlane.bytes[uvIndex] : 128;
        
        // Convert YUV to RGB
        final rgb = _yuvToRgb(yValue, uValue, vValue);
        
        image.setPixelRgb(x, y, rgb[0], rgb[1], rgb[2]);
      }
    }
    
    return Uint8List.fromList(img.encodeJpg(image, quality: 85));
  }

  /// Convert BGRA8888 to JPEG
  static Future<Uint8List> _convertBGRA8888ToJpeg(CameraImage cameraImage) async {
    final int width = cameraImage.width;
    final int height = cameraImage.height;
    final plane = cameraImage.planes[0];
    
    final image = img.Image(width: width, height: height);
    final bytes = plane.bytes;
    int byteIndex = 0;
    
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (byteIndex + 3 < bytes.length) {
          final b = bytes[byteIndex];
          final g = bytes[byteIndex + 1];
          final r = bytes[byteIndex + 2];
          // final a = bytes[byteIndex + 3]; // Alpha channel, skip for JPEG
          
          image.setPixelRgb(x, y, r, g, b);
          byteIndex += 4;
        } else {
          // Fill with black if out of bounds
          image.setPixelRgb(x, y, 0, 0, 0);
        }
      }
    }
    
    return Uint8List.fromList(img.encodeJpg(image, quality: 85));
  }

  /// Convert JPEG to JPEG (passthrough)
  static Future<Uint8List> _convertJPEGToJpeg(CameraImage cameraImage) async {
    return Uint8List.fromList(cameraImage.planes[0].bytes);
  }

  /// Convert NV21 to JPEG
  static Future<Uint8List> _convertNV21ToJpeg(CameraImage cameraImage) async {
    final int width = cameraImage.width;
    final int height = cameraImage.height;
    final yPlane = cameraImage.planes[0];
    final uvPlane = cameraImage.planes[1];
    
    final image = img.Image(width: width, height: height);
    
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final yValue = yPlane.bytes[y * yPlane.bytesPerRow + x];
        final uvIndex = (y ~/ 2) * uvPlane.bytesPerRow + (x ~/ 2) * 2;
        final vValue = uvIndex < uvPlane.bytes.length ? uvPlane.bytes[uvIndex] : 128;
        final uValue = (uvIndex + 1) < uvPlane.bytes.length ? uvPlane.bytes[uvIndex + 1] : 128;
        
        final rgb = _yuvToRgb(yValue, uValue, vValue);
        image.setPixelRgb(x, y, rgb[0], rgb[1], rgb[2]);
      }
    }
    
    return Uint8List.fromList(img.encodeJpg(image, quality: 85));
  }

  /// Convert YUV to RGB
  static List<int> _yuvToRgb(int y, int u, int v) {
    // Convert YUV to RGB using standard conversion formula
    final c = y - 16;
    final d = u - 128;
    final e = v - 128;

    final r = _clamp((298 * c + 409 * e + 128) >> 8);
    final g = _clamp((298 * c - 100 * d - 208 * e + 128) >> 8);
    final b = _clamp((298 * c + 516 * d + 128) >> 8);

    return [r, g, b];
  }

  /// Clamp value between 0-255
  static int _clamp(int value) {
    return value.clamp(0, 255);
  }

  /// Resize image to specified dimensions
  static Future<Uint8List> resizeImage(
    Uint8List imageBytes, {
    required int maxWidth,
    required int maxHeight,
    int quality = 85,
  }) async {
    try {
      final originalImage = img.decodeImage(imageBytes);
      if (originalImage == null) {
        throw Exception('Failed to decode image');
      }

      final resizedImage = img.copyResize(
        originalImage,
        width: maxWidth,
        height: maxHeight,
        interpolation: img.Interpolation.linear,
      );

      return Uint8List.fromList(img.encodeJpg(resizedImage, quality: quality));
    } catch (e) {
      debugPrint('Error resizing image: $e');
      rethrow;
    }
  }

  /// Enhance image for better QR detection
  static Future<Uint8List> enhanceImageForQRDetection(Uint8List imageBytes) async {
    try {
      final image = img.decodeImage(imageBytes);
      if (image == null) {
        throw Exception('Failed to decode image for enhancement');
      }

      // Convert to grayscale for QR detection
      final grayscale = img.grayscale(image);
      
      // Apply contrast enhancement
      final contrasted = img.contrast(grayscale, contrast: 20);
      
      return Uint8List.fromList(img.encodeJpg(contrasted, quality: 95));
    } catch (e) {
      debugPrint('Error enhancing image: $e');
      // Return original if enhancement fails
      return imageBytes;
    }
  }

  /// Extract image metadata
  static Map<String, dynamic> extractImageMetadata(Uint8List imageBytes) {
    try {
      final image = img.decodeImage(imageBytes);
      if (image == null) {
        return {'error': 'Failed to decode image'};
      }

      return {
        'width': image.width,
        'height': image.height,
        'format': 'JPEG',
        'size_bytes': imageBytes.length,
        'has_exif': false, // Basic implementation
      };
    } catch (e) {
      return {'error': 'Failed to extract metadata: $e'};
    }
  }

  /// Create a test pattern image for debugging
  static Future<Uint8List> createTestPattern({
    int width = 300,
    int height = 300,
  }) async {
    final image = img.Image(width: width, height: height);
    
    // Create a colorful test pattern
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final r = (x / width * 255).toInt();
        final g = (y / height * 255).toInt();
        final b = ((x + y) / (width + height) * 255).toInt();
        
        image.setPixelRgb(x, y, r, g, b);
      }
    }
    
    return Uint8List.fromList(img.encodeJpg(image));
  }

  /// Convert image to base64 string
  static String convertToBase64(Uint8List imageBytes) {
    return base64Encode(imageBytes);
  }

  /// Convert base64 string to image bytes
  static Uint8List convertFromBase64(String base64String) {
    return base64Decode(base64String);
  }

  /// Compare two images for similarity (basic implementation)
  static double compareImages(Uint8List image1, Uint8List image2) {
    try {
      final img1 = img.decodeImage(image1);
      final img2 = img.decodeImage(image2);
      
      if (img1 == null || img2 == null) return 0.0;
      
      // Resize to same dimensions if different
      img.Image? resizedImg2 = img2;
      if (img1.width != img2.width || img1.height != img2.height) {
        resizedImg2 = img.copyResize(img2, width: img1.width, height: img1.height);
      }
      
      int diffPixels = 0;
      int totalPixels = img1.width * img1.height;
      
      for (int y = 0; y < img1.height; y++) {
        for (int x = 0; x < img1.width; x++) {
          final pixel1 = img1.getPixel(x, y);
          final pixel2 = resizedImg2.getPixel(x, y);
          
          final r1 = pixel1.r;
          final g1 = pixel1.g;
          final b1 = pixel1.b;
          
          final r2 = pixel2.r;
          final g2 = pixel2.g;
          final b2 = pixel2.b;
          
          // Calculate color difference
          final diff = (r1 - r2).abs() + (g1 - g2).abs() + (b1 - b2).abs();
          if (diff > 50) { // Threshold for significant difference
            diffPixels++;
          }
        }
      }
      
      return 1.0 - (diffPixels / totalPixels);
    } catch (e) {
      debugPrint('Error comparing images: $e');
      return 0.0;
    }
  }
}

/// Image analysis utilities for QR detection
class ImageAnalyzer {
  /// Analyze image for QR code patterns
  static Future<QRDetectionResult> analyzeForQRCode(Uint8List imageBytes) async {
    try {
      final image = img.decodeImage(imageBytes);
      if (image == null) {
        return QRDetectionResult(success: false, error: 'Failed to decode image');
      }

      // Convert to grayscale for analysis
      final grayscale = img.grayscale(image);
      
      // Basic QR pattern detection (simplified)
      final analysis = _analyzeQRPatterns(grayscale);
      
      return QRDetectionResult(
        success: analysis['hasQRPattern'] ?? false,
        confidence: analysis['confidence'] ?? 0.0,
        regions: analysis['regions'] ?? [],
        metadata: analysis,
      );
    } catch (e) {
      return QRDetectionResult(
        success: false,
        error: 'Analysis error: $e',
      );
    }
  }

  /// Basic QR pattern analysis
  static Map<String, dynamic> _analyzeQRPatterns(img.Image image) {
    final width = image.width;
    final height = image.height;
    
    int potentialQRRegions = 0;
    double totalConfidence = 0.0;
    final regions = <Map<String, dynamic>>[];
    
    // Look for finder patterns (simplified)
    for (int y = 20; y < height - 20; y += 10) {
      for (int x = 20; x < width - 20; x += 10) {
        final confidence = _detectFinderPattern(image, x, y);
        if (confidence > 0.7) {
          potentialQRRegions++;
          totalConfidence += confidence;
          regions.add({
            'x': x,
            'y': y,
            'confidence': confidence,
            'type': 'finder_pattern',
          });
        }
      }
    }
    
    final hasQRPattern = potentialQRRegions >= 3; // Need at least 3 finder patterns
    final averageConfidence = potentialQRRegions > 0 
        ? totalConfidence / potentialQRRegions 
        : 0.0;
    
    return {
      'hasQRPattern': hasQRPattern,
      'confidence': averageConfidence,
      'regions': regions,
      'potentialRegionsCount': potentialQRRegions,
    };
  }

  /// Detect QR finder pattern at specific location
  static double _detectFinderPattern(img.Image image, int centerX, int centerY) {
    // Simplified finder pattern detection
    // Real implementation would use more sophisticated pattern matching
    
    try {
      int blackCount = 0;
      // ignore: unused_local_variable
      int whiteCount = 0;
      const patternSize = 7;
      const halfSize = patternSize ~/ 2;
      
      // Check pattern in 7x7 grid
      for (int y = centerY - halfSize; y <= centerY + halfSize; y++) {
        for (int x = centerX - halfSize; x <= centerX + halfSize; x++) {
          if (x >= 0 && x < image.width && y >= 0 && y < image.height) {
            final pixel = image.getPixel(x, y);
            final luminance = pixel.luminance;
            
            if (luminance < 128) {
              blackCount++;
            } else {
              whiteCount++;
            }
          }
        }
      }
      
      // Basic pattern matching (simplified)
      final totalPixels = patternSize * patternSize;
      final blackRatio = blackCount / totalPixels;
      
      // Finder pattern should have specific black/white ratio
      if (blackRatio > 0.4 && blackRatio < 0.6) {
        return blackRatio;
      }
      
      return 0.0;
    } catch (e) {
      return 0.0;
    }
  }
}

/// Result class for QR detection
class QRDetectionResult {
  final bool success;
  final double confidence;
  final List<Map<String, dynamic>> regions;
  final Map<String, dynamic> metadata;
  final String? error;

  QRDetectionResult({
    required this.success,
    this.confidence = 0.0,
    this.regions = const [],
    this.metadata = const {},
    this.error,
  });

  @override
  String toString() {
    return 'QRDetectionResult(success: $success, confidence: $confidence, regions: ${regions.length}, error: $error)';
  }
}

/// Utility functions for base64 encoding/decoding
String base64Encode(Uint8List bytes) {
  return base64.encode(bytes);
}

Uint8List base64Decode(String data) {
  return base64.decode(data);
}
