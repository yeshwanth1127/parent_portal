import 'package:flutter/material.dart';
import 'screens/auth/login_signup_page.dart';

void main() {
  runApp(const ParentPortalApp());
}

class ParentPortalApp extends StatelessWidget {
  const ParentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunkidz Parent Portal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7c3aed),
          brightness: Brightness.light,
          primary: const Color(0xFF7c3aed),
          secondary: const Color(0xFFec4899),
        ),
        useMaterial3: true,
      ),
      home: const LoginSignUpPage(),
    );
  }
}
