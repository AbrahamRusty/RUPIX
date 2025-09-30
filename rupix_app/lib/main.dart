import 'package:flutter/material.dart';
import 'Pages/Login/login.dart';
import 'Pages/WalletHomePage.dart';
import 'Pages/settings/about_screen.dart';
import 'Pages/settings/change_email_screen.dart' as change_email_screen;
import 'Pages/settings/change_password_screen.dart' as change_password_screen;
import 'Pages/settings/change_username_screen.dart' as change_username_screen;
import 'Pages/settings/privacy_policy_screen.dart';
import 'Pages/settings/help_center_screen.dart';
import 'Pages/settings/email_support_screen.dart';
import 'Pages/settings/chat_bot_screen.dart';
import 'Pages/settings/success_screen.dart';
// ignore: unused_import
import 'Pages/settings/setting_home_screen.dart';

void main() {
  runApp(const RupiahWalletApp());
}

class RupiahWalletApp extends StatelessWidget {
  const RupiahWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rupiah Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const WalletHomePage(),

        '/about': (context) => const AboutScreen(),
        '/help_center': (context) => const HelpCenterScreen(),
        '/privacy_policy': (context) => const PrivacyPolicyScreen(),

        '/change_email': (context) =>
            const change_email_screen.ChangeEmailScreen(),
        '/change_password': (context) =>
            const change_password_screen.ChangePasswordScreen(),
        '/change_username': (context) =>
            const change_username_screen.ChangeUsernameScreen(),

        '/email_support': (context) => const EmailSupportScreen(),
        '/chatbot': (context) => const ChatBotScreen(),

        '/success': (context) => const SuccessScreen(),
      },
    );
  }
}
