import 'package:flutter/material.dart';
import 'package:rupix_settings/widgets/logout_dialog.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.purple[800],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Bagian Header Profil
            Container(
              height: 200,
              color: Colors.purple[900],
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                    radius: 30,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Shreya',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Text(
                    'shreya.jcs@gmail.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            
            // Daftar Item Menu
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.purple),
                    title: const Text('Profile Setting'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.purple),
                    title: const Text('Change Email'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/change_email');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.purple),
                    title: const Text('Change Password'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/change_password');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.purple),
                    title: const Text('Change Username'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/change_username');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.privacy_tip,
                      color: Colors.purple,
                    ),
                    title: const Text('Privacy Policy'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/privacy_policy');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help, color: Colors.purple),
                    title: const Text('Help Center'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/help_center');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.purple),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                ],
              ),
            ),
            
            // Tombol Logout
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (context) => const LogoutDialog(),
                  );
                  if (result == true) {
                    // Logika logout
                    // Baris print() sudah dihapus di sini
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      body: const Center(
        child: Text('Halaman Utama Pengaturan', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}