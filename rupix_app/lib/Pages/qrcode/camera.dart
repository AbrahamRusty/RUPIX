import 'dart:async';
// ignore: unused_import
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class CameraPage extends StatefulWidget {
  final Function(String) onQRScanned;
  
  const CameraPage({
    Key? key,
    required this.onQRScanned,
  }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isFlashOn = false;
  bool _isFrontCamera = false;
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        await _initializeCameraController(_selectedCameraIndex);
      } else {
        _showErrorDialog('No cameras available');
      }
    } catch (e) {
      _showErrorDialog('Error initializing camera: $e');
    }
  }

  Future<void> _initializeCameraController(int cameraIndex) async {
    if (_cameras == null || cameraIndex >= _cameras!.length) return;

    final camera = _cameras![cameraIndex];
    
    if (_controller != null) {
      await _controller!.dispose();
    }

    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    try {
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
      
      // Start image stream for continuous scanning
      _startImageStream();
      
    } catch (e) {
      if (mounted) {
        _showErrorDialog('Failed to initialize camera: $e');
      }
    }
  }

  void _startImageStream() {
    if (_controller == null || !_controller!.value.isInitialized) return;

    _controller!.startImageStream((CameraImage image) {
      _processCameraImage(image);
    });
  }

  Future<void> _processCameraImage(CameraImage image) async {
    try {
      // Convert CameraImage to Image format for processing
      // ignore: unused_local_variable
      final imageBytes = await _convertImage(image);
      
      // TODO: Add QR code detection logic here
      // You can use a QR detection library like:
      // - google_ml_kit
      // - firebase_ml_vision
      // - custom QR decoder
      
      // For now, we'll simulate QR detection
      await _simulateQRDetection();
      
    } catch (e) {
      debugPrint('Error processing image: $e');
    }
  }

  Future<Uint8List> _convertImage(CameraImage image) async {
    // Convert CameraImage to JPEG bytes
    // This is a simplified conversion - you might need more complex conversion
    // based on the image format (YUV420, BGRA, etc.)
    try {
      if (image.format.group == ImageFormatGroup.yuv420) {
        // Convert YUV to JPEG
        return _convertYUV420toJPEG(image);
      } else if (image.format.group == ImageFormatGroup.bgra8888) {
        // Convert BGRA to JPEG
        return _convertBGRAtoJPEG(image);
      } else {
        throw Exception('Unsupported image format: ${image.format}');
      }
    } catch (e) {
      throw Exception('Failed to convert image: $e');
    }
  }

  Uint8List _convertYUV420toJPEG(CameraImage image) {
    // Simplified YUV to JPEG conversion
    // In production, use a proper image processing library
    final int width = image.width;
    final int height = image.height;
    
    // Create a simple placeholder image
    final imageData = img.Image(width: width, height: height);
    
    // Fill with gradient for demonstration
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final r = (x / width * 255).toInt();
        final g = (y / height * 255).toInt();
        final b = 128;
        imageData.setPixel(x, y, img.ColorRgb8(r, g, b));
      }
    }
    
    return Uint8List.fromList(img.encodeJpg(imageData));
  }

  Uint8List _convertBGRAtoJPEG(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    
    final imageData = img.Image(width: width, height: height);
    final planes = image.planes;
    
    if (planes.length >= 1) {
      final bytes = planes[0].bytes;
      int byteIndex = 0;
      
      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          if (byteIndex + 3 < bytes.length) {
            final b = bytes[byteIndex];
            final g = bytes[byteIndex + 1];
            final r = bytes[byteIndex + 2];
            imageData.setPixel(x, y, img.ColorRgb8(r, g, b));
            byteIndex += 4; // BGRA - 4 bytes per pixel
          }
        }
      }
    }
    
    return Uint8List.fromList(img.encodeJpg(imageData));
  }

  Future<void> _simulateQRDetection() async {
    // Simulate QR detection delay
    await Future.delayed(const Duration(milliseconds: 1000));
    
    // Simulate finding a QR code (replace with actual QR detection)
    const simulatedQRData = "https://rupix.app/payment/123456";
    
    if (mounted) {
      widget.onQRScanned(simulatedQRData);
    }
  }

  void _toggleFlash() {
    if (_controller == null || !_controller!.value.isInitialized) return;

    setState(() {
      _isFlashOn = !_isFlashOn;
    });

    _controller!.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
  }

  void _switchCamera() {
    if (_cameras == null || _cameras!.length < 2) return;

    setState(() {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
      _isFrontCamera = _cameras![_selectedCameraIndex].lensDirection == 
          CameraLensDirection.front;
    });

    _initializeCameraController(_selectedCameraIndex);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Camera Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera Preview
          if (_isCameraInitialized && _controller != null)
            CameraPreview(_controller!)
          else
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),

          // Scanner Overlay
          _buildScannerOverlay(),

          // Controls
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    if (_controller?.value.hasFlash ?? false)
                      IconButton(
                        icon: Icon(
                          _isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                        ),
                        onPressed: _toggleFlash,
                      ),
                    if (_cameras != null && _cameras!.length > 1)
                      IconButton(
                        icon: const Icon(Icons.cameraswitch, color: Colors.white),
                        onPressed: _switchCamera,
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Instructions
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                children: [
                  Text(
                    'Scan QR Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Position the QR code within the frame',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.black.withOpacity(0.6),
          ],
          stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
        ),
      ),
      child: Column(
        children: [
          const Expanded(flex: 2, child: SizedBox()),
          
          // Scanner Frame
          Expanded(
            flex: 3,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomPaint(
                    painter: _ScannerCornerPainter(),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

extension on CameraValue {
  get hasFlash => null;
}

class _ScannerCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const cornerLength = 20.0;

    // Top left corner
    canvas.drawLine(
      const Offset(0, 0),
      const Offset(cornerLength, 0),
      paint,
    );
    canvas.drawLine(
      const Offset(0, 0),
      const Offset(0, cornerLength),
      paint,
    );

    // Top right corner
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width - cornerLength, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, cornerLength),
      paint,
    );

    // Bottom left corner
    canvas.drawLine(
      Offset(0, size.height),
      Offset(cornerLength, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(0, size.height - cornerLength),
      paint,
    );

    // Bottom right corner
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - cornerLength, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}