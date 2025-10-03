import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      "text": "Halo! Saya RupiX AI Assistant 🤖\nAda yang bisa saya bantu hari ini?",
      "isUser": false,
      "timestamp": DateTime.now(),
      "quickReplies": ["Menu Bantuan", "Top Up", "Transfer", "Masalah Akun"]
    },
  ];

  bool _isTyping = false;

  // Enhanced AI Response System
  Map<String, dynamic> _generateAIResponse(String userText) {
    final text = userText.toLowerCase();
    final now = DateTime.now();

    // Main Menu
    if (text.contains('menu') || text.contains('bantuan') || text.contains('help')) {
      return {
        "text": "Menu Bantuan RupiX 🎯\n\n"
                "1. 💰 Top Up & Saldo\n"
                "2. 📤 Transfer & Pembayaran\n"
                "3. 🔐 Masalah Akun & Keamanan\n"
                "4. 📊 Crypto & Trading\n"
                "5. 🏦 Bank & Mitra\n"
                "6. 📋 Kebijakan & Layanan\n\n"
                "Silakan pilih kategori atau ketik pertanyaan spesifik Anda!",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Top Up Saldo", "Transfer Gagal", "Lupa PIN", "Verifikasi KYC"]
      };
    }

    // Top Up & Balance Issues
    else if (text.contains('top up') || text.contains('saldo') || text.contains('isi ulang')) {
      return {
        "text": "Top Up & Saldo💰\n\n"
                "• Top Up OVO/GoPay/Dana: Max Rp 5jt/hari\n"
                "• Transfer Bank: Proses 1-5 menit\n"
                "• Crypto Deposit: Network fee berlaku\n"
                "• Saldo tertunda? Cek status di Riwayat Transaksi\n\n"
                "Butuh bantuan spesifik?",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Top Up OVO", "Saldo Hilang", "Batasan Top Up", "Kembali ke Menu"]
      };
    }

    // Transfer & Payment Issues
    else if (text.contains('transfer') || text.contains('kirim') || text.contains('gagal')) {
      return {
        "text": "Transfer & Pembayaran📤\n\n"
                "• Transfer Sesama RupiX: Gratis & Instan\n"
                "• Transfer Bank: Rp 2.500/admin\n"
                "• Crypto Transfer: Gas fee blockchain\n"
                "• Transfer gagal? Dana akan dikembalikan dalam 1x24 jam\n\n"
                "Masalah spesifik apa?",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Transfer Bank", "Crypto Transfer", "Status Transfer", "Biaya Transfer"]
      };
    }

    // Account & Security
    else if (text.contains('akun') || text.contains('password') || text.contains('pin') || 
             text.contains('lupa') || text.contains('verifikasi') || text.contains('kyc')) {
      return {
        "text": "Keamanan Akun 🔐\n\n"
                "• Lupa PIN: Gunakan 'Lupa PIN' di login\n"
                "• Verifikasi KYC: Wajib untuk limit tinggi\n"
                "• Ganti Email/No HP: Butuh OTP verifikasi\n"
                "• Aktivitas mencurigakan? Hubungi CS segera\n\n"
                "Butuh bantuan apa?",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Lupa PIN", "Verifikasi KYC", "Ganti Email", "Aktivitas Mencurigakan"]
      };
    }

    // Crypto & Trading
    else if (text.contains('crypto') || text.contains('trading') || text.contains('bitcoin') || 
             text.contains('eth') || text.contains('beli crypto')) {
      return {
        "text": "Crypto & Trading 📊\n\n"
                "• Beli Crypto: Minimal Rp 50.000\n"
                "• Trading Pair: BTC/IDR, ETH/IDR, dll\n"
                "• Withdraw Crypto: Network fee berlaku\n"
                "• Harga real-time dengan spread kompetitif\n\n"
                "Tertarik dengan crypto apa?",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Beli Bitcoin", "Trading Fee", "Withdraw Crypto", "Market Update"]
      };
    }

    // Bank & Partners
    else if (text.contains('bank') || text.contains('bca') || text.contains('bni') || 
             text.contains('mandiri') || text.contains('mitra')) {
      return {
        "text": "Bank & Mitra 🏦\n\n"
                "• Bank Supported: BCA, BNI, Mandiri, BRI, CIMB\n"
                "• Maintenance: Cek notifikasi app untuk jadwal\n"
                "• Partner Crypto: Binance, Coinbase integration\n"
                "• Issue dengan bank tertentu? Laporkan ke CS\n\n"
                "Bank mana yang bermasalah?",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["BCA Problem", "BNI Maintenance", "Add Bank Account", "Partner List"]
      };
    }

    // Policy & Service
    else if (text.contains('kebijakan') || text.contains('privasi') || text.contains('syarat') || 
             text.contains('layanan') || text.contains('fee') || text.contains('biaya')) {
      return {
        "text": "Kebijakan & Layanan 📋\n\n"
                "• Biaya Admin: Transparan di preview transaksi\n"
                "• Privacy Policy: Data Anda 100% aman\n"
                "• Limit Transaksi: Sesuai level verifikasi\n"
                "• Komplain: Email ke support@rupix.com\n\n"
                "Ingin tahu tentang apa?",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Biaya Admin", "Privacy Policy", "Limit Transaksi", "Komplain"]
      };
    }

    // Greetings
    else if (text.contains('halo') || text.contains('hi') || text.contains('hai') || 
             text.contains('pagi') || text.contains('siang') || text.contains('malam')) {
      return {
        "text": "Halo! 👋 Senang bertemu dengan Anda!\nSaya RupiX AI Assistant siap membantu semua kebutuhan finansial Anda.\n\nKetik 'menu' untuk melihat layanan kami!",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Menu", "Top Up", "Transfer", "Crypto"]
      };
    }

    // Thank you
    else if (text.contains('terima kasih') || text.contains('thanks') || text.contains('makasih')) {
      return {
        "text": "Sama-sama! 😊\nTerima kasih telah menggunakan RupiX Wallet.\n\nJika ada pertanyaan lain, jangan ragu untuk bertanya!",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Menu Lain", "Bantuan Lain", "Selesai", "Rating"]
      };
    }

    // Default AI Response
    else {
      return {
        "text": "Saya mengerti Anda bertanya tentang: \"$userText\"\n\n"
                "Sebagai AI Assistant RupiX, saya bisa membantu dengan:\n"
                "• Top Up & Transfer\n• Crypto Trading\n• Masalah Akun\n• Kebijakan Layanan\n\n"
                "Coba ketik lebih spesifik atau pilih dari menu bantuan!",
        "isUser": false,
        "timestamp": now,
        "quickReplies": ["Menu Bantuan", "Contoh Pertanyaan", "Hubungi CS", "Kembali"]
      };
    }
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) return;
    
    _textController.clear();

    // Add user message
    setState(() {
      _messages.insert(0, {
        "text": text,
        "isUser": true,
        "timestamp": DateTime.now(),
        "quickReplies": []
      });
      _isTyping = true;
    });

    // Simulate AI typing
    Future.delayed(const Duration(milliseconds: 1000), () {
      final response = _generateAIResponse(text);
      setState(() {
        _isTyping = false;
        _messages.insert(0, response);
      });
    });
  }

  void _handleQuickReply(String reply) {
    _handleSubmitted(reply);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Color definitions
    final backgroundColor = isDarkMode ? Color(0xFF121212) : Color(0xFF121212);
    final primaryColor = isDarkMode ? Colors.white : Colors.white;
    final secondaryColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400;
    final cardColor = isDarkMode ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
    final userBubbleColor = isDarkMode ? Color(0xFF0088FF) : Color(0xFF0088FF);
    final botBubbleColor = isDarkMode ? Color(0xFF2D2D2D) : Color(0xFF2D2D2D);
    final accentColor = Color.fromARGB(255, 0, 60, 144);
    final quickReplyColor = isDarkMode ? Color.fromARGB(255, 0, 60, 144) : Color.fromARGB(255, 0, 60, 144);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: userBubbleColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.smart_toy, color: Colors.white, size: 18),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RupiX AI Assistant',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Online • Siap Membantu',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: isDarkMode ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E),
        elevation: 2,
        iconTheme: IconThemeData(color: primaryColor),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Show options menu
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Chat Header Info
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: quickReplyColor,
              border: Border(bottom: BorderSide(color: Color(0xFF1E1E1E))),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: accentColor, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'AI Assistant • Respons Cepat • 24/7',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Messages Area
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/chat_bg.png'), // Optional: Add chat background
                  fit: BoxFit.cover,
                  colorFilter: isDarkMode 
                    ? ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken)
                    : ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.lighten),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                reverse: true,
                itemCount: _messages.length + (_isTyping ? 1 : 0),
                itemBuilder: (_, int index) {
                  if (_isTyping && index == 0) {
                    return _buildTypingIndicator(primaryColor, secondaryColor);
                  }
                  
                  final messageIndex = _isTyping ? index - 1 : index;
                  final message = _messages[messageIndex];
                  
                  return Column(
                    children: [
                      _buildMessage(
                        message["text"],
                        message["isUser"],
                        message["timestamp"],
                        userBubbleColor,
                        botBubbleColor,
                        primaryColor,
                        secondaryColor,
                      ),
                      if (message["quickReplies"] != null && message["quickReplies"].isNotEmpty)
                        _buildQuickReplies(
                          message["quickReplies"],
                          quickReplyColor,
                          primaryColor,
                          accentColor,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),

          // Input Area
          _buildTextComposer(isDarkMode, cardColor, primaryColor, accentColor),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(Color primaryColor, Color secondaryColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  'AI sedang mengetik',
                  style: TextStyle(color: secondaryColor, fontSize: 12),
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: 20,
                  height: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(
    String text, 
    bool isUser, 
    DateTime timestamp, 
    Color userBubbleColor, 
    Color botBubbleColor, 
    Color primaryColor, 
    Color secondaryColor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) 
            Container(
              width: 28,
              height: 28,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: userBubbleColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(Icons.smart_toy, color: Colors.white, size: 14),
            ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isUser ? userBubbleColor : botBubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: isUser ? Radius.circular(16) : Radius.circular(4),
                  bottomRight: isUser ? Radius.circular(4) : Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: isUser ? Colors.white : primaryColor,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _formatTime(timestamp),
                    style: TextStyle(
                      color: isUser ? Colors.white70 : secondaryColor,
                      fontSize: 10,
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

  Widget _buildQuickReplies(
    List<String> replies, 
    Color quickReplyColor, 
    Color primaryColor, 
    Color accentColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: replies.map((reply) {
          return GestureDetector(
            onTap: () => _handleQuickReply(reply),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: quickReplyColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: accentColor.withOpacity(0.3)),
              ),
              child: Text(
                reply,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextComposer(bool isDarkMode, Color cardColor, Color primaryColor, Color accentColor) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: <Widget>[
            // Attachment Button
            IconButton(
              icon: Icon(Icons.attach_file, color: primaryColor.withOpacity(0.7)),
              onPressed: () {},
            ),
            
            // Text Input
            Expanded(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                style: TextStyle(color: primaryColor),
                decoration: InputDecoration(
                  hintText: "Ketik pesan...",
                  hintStyle: TextStyle(color: primaryColor.withOpacity(0.5)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),

            // Mic Button
            IconButton(
              icon: Icon(Icons.mic, color: primaryColor.withOpacity(0.7)),
              onPressed: () {},
            ),

            // Send Button
            Container(
              margin: const EdgeInsets.only(left: 4.0),
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white, size: 20),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}