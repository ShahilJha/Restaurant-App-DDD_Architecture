import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/presentation/core/app_theme.dart';
import 'package:restaurant_app/presentation/pages/sign_in/sign_in_page.dart';
import 'package:restaurant_app/presentation/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      builder: () => MaterialApp(
        title: 'Restaurant Application',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.generateThemeData(),
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return SignInPage();
            }
            return SplashPage();
          },
        ),
      ),
    );
  }
}
