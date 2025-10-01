import 'package:flutter/material.dart';

class HalfDrawerMenu extends StatefulWidget {
  const HalfDrawerMenu({super.key});

  @override
  State<HalfDrawerMenu> createState() => _HalfDrawerMenuState();
}

class _HalfDrawerMenuState extends State<HalfDrawerMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0), // mulai dari kiri
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // mainkan animasi saat widget muncul
    _controller.forward();
  }

  void _closeDrawer() {
    _controller.reverse().then((_) {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // swipe kanan untuk close
        if (details.delta.dx > 10) {
          _closeDrawer();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // background semi-transparent
            GestureDetector(
              onTap: _closeDrawer,
              child: Container(color: Colors.black54),
            ),
            // drawer dengan animasi slide
            SlideTransition(
              position: _slideAnimation,
              child: Material(
                elevation: 16,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: double.infinity,
                  color: const Color(0xFF3C8DFF),
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        _menuItem(icon: Icons.privacy_tip, label: "Privacy Policy", onTap: () => debugPrint("Privacy Policy tapped")),
                        _menuItem(icon: Icons.email, label: "Email Support", onTap: () => debugPrint("Email Support tapped")),
                        _menuItem(icon: Icons.info, label: "About", onTap: () => debugPrint("About tapped")),
                        _menuItem(icon: Icons.email_outlined, label: "Change Email", onTap: () => debugPrint("Change Email tapped")),
                        _menuItem(icon: Icons.lock, label: "Change Password", onTap: () => debugPrint("Change Password tapped")),
                        _menuItem(icon: Icons.help, label: "Help Center", onTap: () => debugPrint("Help Center tapped")),
                        _menuItem(icon: Icons.chat, label: "Chat Bot", onTap: () => debugPrint("Chat Bot tapped")),
                        _menuItem(icon: Icons.settings, label: "Settings", onTap: () => debugPrint("Settings tapped")),
                        const SizedBox(height: 40),
                        InkWell(
                          onTap: () => debugPrint("Logout tapped"),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.logout, color: Colors.white),
                                SizedBox(width: 12),
                                Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem({required IconData icon, required String label, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 22),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

// Cara panggil dari halaman utama:
void openHalfDrawer(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (_) => const HalfDrawerMenu(),
  );
}
