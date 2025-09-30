import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text(
        'Are you sure, You want to logout?',
        textAlign: TextAlign.center, // Menengahkan teks judul
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
            
      // Menggunakan 'content' untuk menampung tombol dalam satu baris tengah
      content: Row(
        // Menyusun tombol agar berada di tengah dialog
        mainAxisAlignment: MainAxisAlignment.center,
        // Menjaga agar Row mengambil ruang minimum
        mainAxisSize: MainAxisSize.min, 
        children: <Widget>[
          
          // [KIRI] Tombol 'Yes', warna HIJAU (Log Out)
          ElevatedButton(
            onPressed: () {
              // Mengembalikan TRUE untuk melanjutkan Log Out
              Navigator.of(context).pop(true); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Disesuaikan menjadi HIJAU
              minimumSize: const Size(100, 40),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Yes', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          
          const SizedBox(width: 12), // Jarak pemisah
          
          // [KANAN] Tombol 'No', warna MERAH (Batal Log Out)
          ElevatedButton(
            onPressed: () {
              // Mengembalikan FALSE untuk membatalkan Log Out
              Navigator.of(context).pop(false); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Disesuaikan menjadi MERAH
              minimumSize: const Size(100, 40),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('No', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
      
      // actions dikosongkan karena tombol sudah di content
      actions: const [], 
    );
  }
}