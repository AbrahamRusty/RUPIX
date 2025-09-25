import 'package:flutter/material.dart';
import 'package:rupix_settings/screens/profile_settings_screen.dart';
import 'package:rupix_settings/screens/about_screen.dart';
import 'package:rupix_settings/screens/change_email_screen.dart';
import 'package:rupix_settings/screens/change_password_screen.dart';
import 'package:rupix_settings/screens/change_username_screen.dart';
import 'package:rupix_settings/screens/help_center_screen.dart';
import 'package:rupix_settings/screens/privacy_policy_screen.dart';
import 'package:rupix_settings/screens/success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rupix Settings',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // Definisikan rute (routes) Anda di sini.
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfileSettingsScreen(),
        '/about': (context) => const AboutScreen(),
        '/change_email': (context) => const ChangeEmailScreen(),
        '/change_password': (context) => const ChangePasswordScreen(),
        '/change_username': (context) => const ChangeUsernameScreen(),
        '/help_center': (context) => const HelpCenterScreen(),
        '/privacy_policy': (context) => const PrivacyPolicyScreen(),
      },
      // Gunakan onGenerateRoute jika Anda perlu meneruskan argumen.
      onGenerateRoute: (settings) {
        if (settings.name == '/success') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return SuccessScreen(message: args);
            },
          );
        }
        // Biarkan framework menangani rute lain.
        return null;
      },
    );
  }
}