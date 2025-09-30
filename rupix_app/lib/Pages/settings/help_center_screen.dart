import 'package:flutter/material.dart';

// Definisi variabel warna untuk konsistensi
const Color customBlue = Color(0xFF0088FF);

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  HelpCenterScreenState createState() => HelpCenterScreenState();
}

class HelpCenterScreenState extends State<HelpCenterScreen> {
  // Data FAQ
  final List<Item> _data = [
    Item(
      headerValue: 'Account & Registration',
      faqContent: [
        'Q: How do I register for a RupiX account?',
        'A: Download the RupiX app, open , and select “Sign Up.” Fill in your personal details, verify your phone number, and set a secure PIN.',
        'Q: Why do I need to complete KYC verification?',
        'A: KYC (Know Your Customer) is required by regulation to ensure the security of your account and enable you to use all RupiX features (such as top-up, transfer, and withdrawals).',
        'Q: I forgot my PIN, what should I do?',
        'A: Tap on “Forgot PIN” at the login screen, follow the verification steps, and create a new PIN.',
      ],
    ),
    Item(
      headerValue: 'Transaction & Payments',
      faqContent: [
        'Q: Where can I use RupiX to pay?',
        'A: RupixX can be used to pay at online merchants, offline stores, and bill payments (electricity, water, internet, etc.) listed in the app.',
        'Q: Can I transfer money to another RupixX user?',
        'A: Yes. Go to “Transfer,” enter the recipient’s phone number or RupiX ID, input the amount, and confirm with your PIN.',
        'Q: Is there a transaction fee?',
        'A: Transactions within RupiX are generally free. Some services (e.g., interbank transfers) may apply a small fee depending on the partner bank.',
      ],
    ),
    Item(
      headerValue: 'Security',
      faqContent: [
        'Q: How do I keep my account safe?',
        'A: Never share your PIN or OTP with anyone, even if they claim to be from RupixX. Always use the official app and enable device security features.',
        'Q: What should I do if I suspect unauthorized activity?',
        'A: Immediately change your PIN and contact RupiX Customer Service to secure your account.',
      ],
    ),
    Item(
      headerValue: 'Promotions & Rewards',
      faqContent: [
        'Q: How do I participate in promotions?',
        'A: Stay tuned to our in-app announcements and social media for the latest promotions and rewards programs. Follow the specific terms and conditions for each promotion.',
        'Q: How do I redeem my rewards?',
        'A: Rewards can be redeemed through the "Rewards" section in your app. Follow the instructions for each reward type.',
      ],
    ),
  ];

  // Fungsi untuk menampilkan dialog pop-up FAQ
  void _showFaqDialog(
    BuildContext context,
    String title,
    List<String> content,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: customBlue, // Menggunakan customBlue
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 247, 251, 254),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content.map((text) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: text.startsWith('Q:')
                          ? Colors.black87
                          : Colors.black54,
                      fontWeight: text.startsWith('Q:')
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                ), // Sesuaikan warna teks tombol
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // PERUBAHAN: Warna judul dan background disesuaikan
        title: const Text('Help Center', style: TextStyle(color: Colors.white)),
        backgroundColor: customBlue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Ikon kembali putih
        // BARIS DI BAWAH INI DIHILANGKAN UNTUK MENGHILANGKAN IKON SEARCH
        /*
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search),
          ),
        ],
        */
        // Ganti dengan actions: const [], atau hapus properti actions:
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Bagian FAQ
            ..._data.map<Widget>((Item item) {
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(
                    item.headerValue,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    _showFaqDialog(context, item.headerValue, item.faqContent);
                  },
                ),
              );
            }).toList(),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // 3. PERBAIKAN: ListTile Email - Navigasi
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.email, color: customBlue),
                      title: const Text('Email'),
                      subtitle: const Text('your.email@gmail.com'),
                      onTap: () {
                        Navigator.pushNamed(context, '/email_support');
                      },
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 4. PERBAIKAN: ListTile Customer Service - Navigasi & Hapus Duplikat
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(
                        Icons.support_agent,
                        color: customBlue,
                      ),
                      title: const Text('Customer Service'),
                      subtitle: const Text('Call RupiX Support'),
                      onTap: () {
                        Navigator.pushNamed(context, '/chatbot');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Ubah kelas Item agar menyimpan daftar string FAQ
class Item {
  Item({
    required this.headerValue,
    required this.faqContent, // Sekarang list of strings
  });
  String headerValue;
  List<String> faqContent; // Mengganti expandedValue
}
