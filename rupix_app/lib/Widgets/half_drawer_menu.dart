import 'package:flutter/material.dart';
import 'package:rupix_app/widgets/logout_dialog.dart';
import 'package:rupix_app/Pages/Settings/about_pages.dart';

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

  // Fungsi untuk menampilkan dialog logout
  Future<void> _showLogoutDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => LogoutDialog(),
    );
    
    if (result == true) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (Route<dynamic> route) => false,
      );
    }
  }

  // Fungsi untuk handle menu tap dengan navigasi yang benar
  void _onMenuTap(String label) {
    // Close drawer dulu, lalu navigasi setelah drawer benar-benar tertutup
    _controller.reverse().then((_) {
      if (mounted) {
        Navigator.of(context).pop(); // Close drawer
        
        // Tunggu sebentar untuk memastikan drawer sudah tertutup
        Future.delayed(Duration(milliseconds: 100), () {
          switch (label) {
            case "About":
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
              break;
            case "Privacy Policy":
              // Navigate to Privacy Policy page
              debugPrint("Privacy Policy tapped");
              break;
            case "Email Support":
              // Navigate to Email Support
              debugPrint("Email Support tapped");
              break;
            case "Change Email":
              // Navigate to Change Email page
              debugPrint("Change Email tapped");
              break;
            case "Change Password":
              // Navigate to Change Password page
              debugPrint("Change Password tapped");
              break;
            case "Help Center":
              // Navigate to Help Center page
              debugPrint("Help Center tapped");
              break;
            case "Chat Bot":
              // Navigate to Chat Bot page
              debugPrint("Chat Bot tapped");
              break;
            case "Settings":
              // Navigate to Settings page
              debugPrint("Settings tapped");
              break;
            default:
              debugPrint("$label tapped");
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Color definitions
    final drawerColor = isDarkMode ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
    final textColor = isDarkMode ? Colors.white : Colors.white;
    final iconColor = isDarkMode ? Colors.white : Colors.white;
    final logoutColor = Color(0xFFD32F2F);

    drawerWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background gelap
          GestureDetector(
            onTap: _closeDrawer,
            child: Container(color: Colors.black54),
          ),
          // Drawer dengan gesture
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
                  color: drawerColor,
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        _menuItem(Icons.privacy_tip, "Privacy Policy", iconColor, textColor),
                        _menuItem(Icons.email, "Email Support", iconColor, textColor),
                        _menuItem(Icons.info, "About", iconColor, textColor),
                        _menuItem(Icons.email_outlined, "Change Email", iconColor, textColor),
                        _menuItem(Icons.lock, "Change Password", iconColor, textColor),
                        _menuItem(Icons.help, "Help Center", iconColor, textColor),
                        _menuItem(Icons.chat, "Chat Bot", iconColor, textColor),
                        _menuItem(Icons.settings, "Settings", iconColor, textColor),
                        const SizedBox(height: 40),
                        // Logout Button
                        InkWell(
                          onTap: _showLogoutDialog,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              color: logoutColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: logoutColor),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: logoutColor),
                                const SizedBox(width: 12),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: logoutColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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

  Widget _menuItem(IconData icon, String label, Color iconColor, Color textColor) {
    return InkWell(
      onTap: () => _onMenuTap(label),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}