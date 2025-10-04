import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rupix_app/pages/QrCode/camera.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});

  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  bool _isLoading = true;
  String? _scannedData;
  bool _isScanning = true;
  bool _hasCameraPermission = false;
  String _errorMessage = '';
  bool _isCheckingPermission = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      // Check camera permission status
      final status = await Permission.camera.status;

      if (status.isGranted) {
        setState(() {
          _hasCameraPermission = true;
          _isLoading = false;
        });
      } else if (status.isDenied) {
        // Permission belum diberikan, tapi bisa diminta
        setState(() {
          _hasCameraPermission = false;
          _isLoading = false;
        });
      } else if (status.isPermanentlyDenied) {
        // Permission ditolak permanen, perlu buka settings
        setState(() {
          _hasCameraPermission = false;
          _errorMessage = 'Izin kamera ditolak permanen. Buka pengaturan untuk mengizinkan akses kamera.';
          _isLoading = false;
        });
      } else if (status.isRestricted) {
        // Permission dibatasi (iOS)
        setState(() {
          _hasCameraPermission = false;
          _errorMessage = 'Akses kamera dibatasi. Periksa pengaturan perangkat Anda.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasCameraPermission = false;
        _errorMessage = 'Error memeriksa izin kamera: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _requestCameraPermission() async {
    try {
      setState(() {
        _isCheckingPermission = true;
        _errorMessage = '';
      });

      final status = await Permission.camera.request();

      if (status.isGranted) {
        setState(() {
          _hasCameraPermission = true;
          _isCheckingPermission = false;
        });
      } else if (status.isDenied) {
        setState(() {
          _hasCameraPermission = false;
          _errorMessage = 'Izin kamera ditolak. Anda perlu mengizinkan akses kamera untuk menggunakan fitur scan QR.';
          _isCheckingPermission = false;
        });
      } else if (status.isPermanentlyDenied) {
        setState(() {
          _hasCameraPermission = false;
          _errorMessage = 'Izin kamera ditolak permanen. Buka pengaturan untuk mengizinkan akses kamera.';
          _isCheckingPermission = false;
        });
        
        // Tampilkan dialog untuk buka settings
        _showPermissionSettingsDialog();
      }
    } catch (e) {
      setState(() {
        _hasCameraPermission = false;
        _errorMessage = 'Error meminta izin kamera: $e';
        _isCheckingPermission = false;
      });
    }
  }

  void _showPermissionSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Izin Kamera Diperlukan',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Akses kamera ditolak permanen. Buka pengaturan untuk mengizinkan akses kamera?',
          style: TextStyle(color: Colors.grey[400]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Nanti', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Buka Pengaturan'),
          ),
        ],
      ),
    );
  }

  void _handleQRScanned(String qrData) {
    if (!_isScanning) return;
    
    setState(() {
      _isScanning = false;
      _scannedData = qrData;
    });
    
    _showScanResultDialog(qrData);
  }

  void _showScanResultDialog(String qrData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'QR Code Berhasil DiScan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data yang terdeteksi:',
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[700]!),
              ),
              child: SelectableText(
                qrData,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Pilih tindakan:',
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetScanner();
            },
            child: const Text(
              'Scan Lagi',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _processQRData(qrData);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Proses Data'),
          ),
        ],
      ),
    );
  }

  void _resetScanner() {
    setState(() {
      _isScanning = true;
      _scannedData = null;
    });
  }

  void _processQRData(String qrData) {
    String message = '';
    Color backgroundColor = Colors.green;

    if (qrData.startsWith('http')) {
      message = 'Membuka link: $qrData';
    } else if (qrData.contains('TRANSFER')) {
      message = 'Membuka halaman transfer';
    } else if (qrData.contains('PAYMENT')) {
      message = 'Membuka halaman pembayaran';
    } else if (qrData.contains('WALLET')) {
      message = 'Membuka top up wallet';
    } else {
      message = 'Data QR berhasil diproses';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  void _openCameraForQRScan() {
    if (!_hasCameraPermission) {
      _requestCameraPermission();
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(
          onQRScanned: _handleQRScanned,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 60, 144),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Scan QR Code',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? _buildLoadingState()
          : _buildScannerInterface(),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.blue,
            strokeWidth: 3,
          ),
          SizedBox(height: 20),
          Text(
            'Memeriksa izin kamera...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerInterface() {
    if (_errorMessage.isNotEmpty) {
      return _buildErrorState();
    }

    if (!_hasCameraPermission) {
      return _buildPermissionDeniedState();
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                const Color(0xFF1A1A1A),
                Colors.black,
              ],
            ),
          ),
        ),
        _buildScannerOverlay(),
        Column(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: _buildScannerFrame(),
            ),
            Expanded(
              flex: 2,
              child: _buildBottomSection(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64,
            ),
            const SizedBox(height: 20),
            Text(
              'Terjadi Error',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _checkCameraPermission,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Coba Lagi',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionDeniedState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              color: Colors.orange,
              size: 64,
            ),
            const SizedBox(height: 20),
            const Text(
              'Izin Kamera Diperlukan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Aplikasi membutuhkan akses kamera untuk memindai QR code. Izinkan akses kamera untuk melanjutkan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            if (_isCheckingPermission)
              const CircularProgressIndicator(color: Colors.blue)
            else
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _requestCameraPermission,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Izinkan Kamera',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: _showManualInputDialog,
                    child: const Text(
                      'Input Manual Saja',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
          ],
        ),
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
            Colors.black.withOpacity(0.8),
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.black.withOpacity(0.8),
          ],
          stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
        ),
      ),
    );
  }

  Widget _buildScannerFrame() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: CustomPaint(
              painter: _ScannerCornerPainter(),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Arahkan kamera ke QR Code',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _isScanning ? 'Siap memindai...' : 'QR Code terdeteksi!',
            style: TextStyle(
              color: _isScanning ? Colors.grey : Colors.green,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isScanning ? _openCameraForQRScan : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBackgroundColor: Colors.grey[600],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isScanning ? Icons.qr_code_scanner : Icons.check_circle,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _isScanning ? 'Mulai Scan QR Code' : 'QR Code Terdeteksi',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: _showManualInputDialog,
            child: const Text(
              'Input Kode Manual',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900]!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                  size: 24,
                ),
                SizedBox(height: 8),
                Text(
                  'Scan QR code untuk:\n• Transfer ke pengguna lain\n• Pembayaran merchant\n• Top up saldo\n• Dan transaksi lainnya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showManualInputDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Input Kode Manual',
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Masukkan kode QR di sini...',
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(context);
                _handleQRScanned(controller.text.trim());
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Proses'),
          ),
        ],
      ),
    );
  }
}

class _ScannerCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const cornerLength = 25.0;

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

    // Animated scanning line
    final animationPaint = Paint()
      ..color = Colors.blue.withOpacity(0.6)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final now = DateTime.now().millisecondsSinceEpoch;
    final animationValue = (now % 2000) / 2000;
    final lineY = size.height * animationValue;

    canvas.drawLine(
      Offset(0, lineY),
      Offset(size.width, lineY),
      animationPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}