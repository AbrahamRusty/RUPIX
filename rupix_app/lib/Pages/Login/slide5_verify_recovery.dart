import 'package:flutter/material.dart';
import 'slide6_selamat.dart';

class Slide5VerifyRecovery extends StatefulWidget {
  final List<String> recoveryPhrase;

  const Slide5VerifyRecovery({super.key, required this.recoveryPhrase});

  @override
  State<Slide5VerifyRecovery> createState() => _Slide5VerifyRecoveryState();
}

class _Slide5VerifyRecoveryState extends State<Slide5VerifyRecovery> {
  final Map<int, String> _selectedWords = {};
  final List<int> _positionsToVerify = [
    1,
    4,
    7,
  ]; // Positions 1, 4, 7 (0-indexed: 0, 3, 6)

  List<String> _getShuffledWords() {
    final allWords = List<String>.from(widget.recoveryPhrase);
    // Add some distractor words
    allWords.addAll(["extra", "word", "test", "dummy", "phrase"]);
    allWords.shuffle();
    return allWords;
  }

  void _selectWord(int position, String word) {
    setState(() {
      _selectedWords[position] = word;
    });
  }

  bool _isVerificationComplete() {
    return _positionsToVerify.every((pos) => _selectedWords.containsKey(pos));
  }

  bool _isVerificationCorrect() {
    for (final pos in _positionsToVerify) {
      if (_selectedWords[pos] != widget.recoveryPhrase[pos]) {
        return false;
      }
    }
    return true;
  }

  void _verifyPhrase() {
    if (!_isVerificationComplete()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Harap isi semua posisi")));
      return;
    }

    if (_isVerificationCorrect()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Slide6Selamat()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Kata yang dipilih tidak cocok. Coba lagi."),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        _selectedWords.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final shuffledWords = _getShuffledWords();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Instruksi
            const Text(
              "Verifikasi Recovery Phrase",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            const Text(
              "Pilih kata-katanya dalam urutan yang benar.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Kotak Kosong
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: _positionsToVerify.map((pos) {
                  final wordIndex = pos;
                  final selectedWord = _selectedWords[pos];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: selectedWord != null
                          ? Colors.green[900]
                          : Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedWord != null
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${wordIndex + 1}.",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            selectedWord ?? "Pilih kata",
                            style: TextStyle(
                              color: selectedWord != null
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 30),

            // Kumpulan Kata
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: shuffledWords.length,
                  itemBuilder: (context, index) {
                    final word = shuffledWords[index];
                    final isSelected = _selectedWords.values.contains(word);

                    return InkWell(
                      onTap: () {
                        // Find the first empty position
                        final emptyPosition = _positionsToVerify.firstWhere(
                          (pos) => !_selectedWords.containsKey(pos),
                          orElse: () => -1,
                        );

                        if (emptyPosition != -1) {
                          _selectWord(emptyPosition, word);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue[900]
                              : Colors.grey[800],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            word,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey[300],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Verifikasi
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isVerificationComplete()
                      ? const Color.fromARGB(255, 0, 60, 144)
                      : Colors.grey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _isVerificationComplete() ? _verifyPhrase : null,
                child: const Text(
                  "Verifikasi",
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
}
