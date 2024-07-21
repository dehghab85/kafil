import 'package:flutter/material.dart';
import 'package:nava/core/theme/theme.dart';
import 'package:nava/features/auth/view/pages/SignupPage.dart';
import 'package:nava/features/auth/view/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      home: const Loginpage(),
    );
  }
}
