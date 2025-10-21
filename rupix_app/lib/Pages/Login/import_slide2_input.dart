import 'package:flutter/material.dart';
import 'import_slide3_password.dart';
import 'import_slide1_metode.dart';

class ImportSlide2Input extends StatefulWidget {
  final ImportMethod selectedMethod;

  const ImportSlide2Input({super.key, required this.selectedMethod});

  @override
  State<ImportSlide2Input> createState() => _ImportSlide2InputState();
}

class _ImportSlide2InputState extends State<ImportSlide2Input> {
  final TextEditingController _inputController = TextEditingController();
  String? _errorText;

  void _validateAndProceed() {
    setState(() {
      _errorText = null;
    });

    final input = _inputController.text.trim();

    if (input.isEmpty) {
      setState(() {
        _errorText = "Input tidak boleh kosong";
      });
      return;
    }

    // Dummy validation based on method
    if (widget.selectedMethod == ImportMethod.recoveryPhrase) {
      final words = input.split(' ');
      if (words.length != 12 && words.length != 24) {
        setState(() {
          _errorText = "Recovery phrase harus 12 atau 24 kata";
        });
        return;
      }
    } else if (widget.selectedMethod == ImportMethod.privateKey) {
      if (!RegExp(r'^0x[a-fA-F0-9]{64}$').hasMatch(input)) {
        setState(() {
          _errorText = "Private key harus dalam format hex yang valid";
        });
        return;
      }
    } else if (widget.selectedMethod == ImportMethod.fileKeystore) {
      // For file, assume it's a path or JSON string for dummy
      if (!input.contains('{') || !input.contains('}')) {
        setState(() {
          _errorText = "File keystore harus berupa JSON yang valid";
        });
        return;
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImportSlide3Password()),
    );
  }

  Widget _buildInputField() {
    if (widget.selectedMethod == ImportMethod.recoveryPhrase) {
      return TextField(
        controller: _inputController,
        maxLines: 4,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Masukkan Recovery Phrase",
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: "kata1 kata2 kata3 ...",
          hintStyle: const TextStyle(color: Colors.grey),
          errorText: _errorText,
          errorStyle: const TextStyle(color: Colors.red),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB86EFF)),
          ),
        ),
      );
    } else if (widget.selectedMethod == ImportMethod.privateKey) {
      return TextField(
        controller: _inputController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Masukkan Private Key",
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: "0x...",
          hintStyle: const TextStyle(color: Colors.grey),
          errorText: _errorText,
          errorStyle: const TextStyle(color: Colors.red),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB86EFF)),
          ),
        ),
      );
    } else if (widget.selectedMethod == ImportMethod.fileKeystore) {
      return Column(
        children: [
          const Text(
            "Pilih File Keystore",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              // Dummy file picker
              _inputController.text =
                  '{"address":"0x123","crypto":{"cipher":"aes-128-ctr","ciphertext":"dummy"}}';
            },
            icon: const Icon(Icons.file_upload, color: Colors.black),
            label: const Text(
              "Pilih File",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB86EFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _inputController,
            maxLines: 5,
            readOnly: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Konten File Keystore",
              labelStyle: const TextStyle(color: Colors.grey),
              errorText: _errorText,
              errorStyle: const TextStyle(color: Colors.red),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB86EFF)),
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Judul
            const Text(
              "Input Data Pemulihan",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Deskripsi
            Text(
              widget.selectedMethod == ImportMethod.recoveryPhrase
                  ? "Masukkan recovery phrase Anda dengan benar."
                  : widget.selectedMethod == ImportMethod.privateKey
                  ? "Masukkan private key hex Anda."
                  : "Pilih dan unggah file keystore JSON Anda.",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 40),

            // Input Field
            _buildInputField(),

            const Spacer(),

            // Tombol Lanjutkan
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB86EFF),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _validateAndProceed,
                child: const Text(
                  "Lanjutkan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
