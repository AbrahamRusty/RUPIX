import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rupix_settings/main.dart';

void main() {
  testWidgets('Drawer shows profile information and opens correctly', (WidgetTester tester) async {
    // Membangun aplikasi dan memicu frame.
    await tester.pumpWidget(const MyApp());

    // Memverifikasi bahwa halaman utama muncul dengan judul "Settings"
    // Ini mengasumsikan AppBar Anda memiliki judul 'Settings'
    expect(find.text('Settings'), findsOneWidget);

    // Membuka drawer dengan menggeser dari kiri ke kanan.
    await tester.dragFrom(tester.getTopLeft(find.byType(Scaffold)), const Offset(300, 0));
    await tester.pumpAndSettle(); // Menunggu animasi drawer selesai.

    // Memverifikasi bahwa informasi profil muncul di dalam drawer.
    expect(find.text('Shreya'), findsOneWidget);
    expect(find.text('shreya.jcs@gmail.com'), findsOneWidget);

    // Memverifikasi bahwa tombol 'Log Out' terlihat.
    expect(find.text('Log Out'), findsOneWidget);
  });
}