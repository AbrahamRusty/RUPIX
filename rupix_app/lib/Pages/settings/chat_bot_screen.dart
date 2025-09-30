import 'package:flutter/material.dart';

const Color customBlue = Color(0xFF0088FF); 
const Color inputFieldColor = Color(0xFFF0F0F0); 

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textController = TextEditingController();
  // List pesan diisi terbalik (reverse: true), pesan baru dimasukkan di index 0
  final List<String> _messages = [
    "Bot: Halo! Saya RupiX Bot. Ada yang bisa saya bantu? Coba ketik 'menu' atau 'email'.",
  ];

  // LOGIKA BARU: Fungsi untuk menghasilkan balasan Bot
  String _generateBotResponse(String userText) {
    final text = userText.toLowerCase();

    if (text.contains('menu')) {
      return "Bot: Tentu. Saya bisa membantu dengan topik ini: 1. Ubah Akun (email/password/username); 2. Bantuan (FAQ/Kontak); 3. Kebijakan. Silakan ketik kata kunci yang relevan.";
    } 
    
    // Logika yang terhubung dengan Change Email Screen
    else if (text.contains('email') || text.contains('ubah email')) {
      return "Bot: Untuk mengubah alamat email, silakan ketik 'navigasi email' atau Anda bisa langsung ke Pengaturan > Ubah Email.";
    } 
    
    // Logika yang terhubung dengan Change Password Screen
    else if (text.contains('password') || text.contains('lupa pin')) {
      return "Bot: Untuk masalah PIN/Password, Anda bisa mencoba fitur 'Lupa PIN' di layar masuk atau gunakan menu Pengaturan > Ubah Password.";
    } 
    
    // Logika yang terhubung dengan FAQ/KYC (dari HelpCenterScreen)
    else if (text.contains('kyc') || text.contains('verifikasi') || text.contains('registrasi')) {
      // Mengambil jawaban FAQ dari data yang seharusnya ada di HelpCenterScreen
      return "Bot: KYC (Know Your Customer) diperlukan oleh regulasi untuk memastikan keamanan akun Anda dan memungkinkan Anda menggunakan semua fitur RupiX (seperti top-up, transfer, dan penarikan).";
    }

    // Balasan umum jika tidak ada keyword yang cocok
    return "Bot: Maaf, saya tidak mengerti. Coba ketik kata kunci lain, seperti 'menu', 'email', atau 'kyc'.";
  }

  // LOGIKA BARU: Fungsi untuk menavigasi (simulasi tombol/link di chat)
  void _handleNavigation(String routeName) {
    if (routeName == '/change_email') {
      Navigator.pushNamed(context, '/change_email');
    }
    // Tambahkan navigasi lain jika diperlukan (contoh: '/change_password')
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) return;
    
    _textController.clear();

    // 1. Tambahkan pesan pengguna ke list
    setState(() {
      _messages.insert(0, "Anda: $text");
    });
    
    // 2. Generate dan tambahkan balasan bot
    final botResponse = _generateBotResponse(text);
    
    // Jika pesan adalah perintah navigasi khusus
    if (text.toLowerCase() == 'navigasi email') {
        _handleNavigation('/change_email');
        return; // Hentikan eksekusi agar bot tidak membalas lagi
    }

    // Tunda sedikit agar terlihat seperti bot sedang mengetik
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        _messages.insert(0, botResponse);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RupiX Chatbot', style: TextStyle(color: Colors.white)),
        backgroundColor: customBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          // Area Pesan
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true, 
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _buildMessage(_messages[index]),
            ),
          ),
          const Divider(height: 1.0),
          // Kotak Input Pesan
          _buildTextComposer(),
        ],
      ),
    );
  }

  // ... (Fungsi _buildTextComposer() dan _buildMessage() tetap sama, memastikan posisi input sudah di atas)
  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0), 
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), 
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: SafeArea( 
        top: false, 
        child: Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0), 
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: "Ketik pesan...",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    filled: true,
                    fillColor: inputFieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send, color: customBlue),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(String text) {
    final isUser = text.startsWith("Anda:");
    // Hapus awalan "Anda: " atau "Bot: " dari tampilan pesan
    final messageContent = text.replaceFirst(isUser ? "Anda: " : "Bot: ", ""); 

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0), 
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75, 
            ),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isUser ? customBlue.withOpacity(0.8) : Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                messageContent,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}