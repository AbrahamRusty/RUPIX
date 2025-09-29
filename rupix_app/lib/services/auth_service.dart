import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      final isAvailable = await auth.canCheckBiometrics;
      if (!isAvailable) return false;

      final didAuthenticate = await auth.authenticate(
        localizedReason: 'Gunakan Face ID atau Fingerprint untuk akses dompetmu',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );

      return didAuthenticate;
    } catch (e) {
      print("Auth error: $e");
      return false;
    }
  }
}
