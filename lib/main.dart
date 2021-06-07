import 'package:flutter/material.dart';
import 'config/themes/app_theme.dart';
import 'core/auth/sign_in/sign_in.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'save me',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: appTheme,
      home: SignInScreen(),
    );
  }
}
