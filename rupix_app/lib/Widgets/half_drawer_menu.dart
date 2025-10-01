import 'package:flutter/material.dart';

class HalfDrawerMenu extends StatefulWidget {
  const HalfDrawerMenu({super.key});

  @override
  State<HalfDrawerMenu> createState() => _HalfDrawerMenuState();
}

class _HalfDrawerMenuState extends State<HalfDrawerMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  double dragStartX = 0;
  double drawerWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

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
    drawerWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // background gelap
          GestureDetector(
            onTap: _closeDrawer,
            child: Container(color: Colors.black54),
          ),
          // drawer dengan gesture full
          SlideTransition(
            position: _slideAnimation,
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragStart: (details) {
                  dragStartX = details.globalPosition.dx;
                },
                onHorizontalDragUpdate: (details) {
                  final dragDistance = details.globalPosition.dx - dragStartX;
                  if (dragDistance > drawerWidth * 0.3) {
                    _closeDrawer();
                  }
                },
                child: Container(
                  width: drawerWidth,
                  height: double.infinity,
                  color: const Color(0xFF3C8DFF),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
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
                        _menuItem(Icons.privacy_tip, "Privacy Policy"),
                        _menuItem(Icons.email, "Email Support"),
                        _menuItem(Icons.info, "About"),
                        _menuItem(Icons.email_outlined, "Change Email"),
                        _menuItem(Icons.lock, "Change Password"),
                        _menuItem(Icons.help, "Help Center"),
                        _menuItem(Icons.chat, "Chat Bot"),
                        _menuItem(Icons.settings, "Settings"),
                        const SizedBox(height: 40),
                        InkWell(
                          onTap: () => debugPrint("Logout tapped"),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: const [
                                Icon(Icons.logout, color: Colors.white),
                                SizedBox(width: 12),
                                Text("Logout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
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
          ),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String label) {
    return InkWell(
      onTap: () => debugPrint("$label tapped"),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 22),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
