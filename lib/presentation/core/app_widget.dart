import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/core/app_theme.dart';
import 'package:restaurant_app/presentation/pages/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Application',
      theme: AppTheme.generateThemeData(),
      home: SignInPage(),
    );
  }
}
