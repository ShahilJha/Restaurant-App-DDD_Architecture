import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/application/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            print('authenticated');
          },
          unauthenticated: (_) {
            print('authenticated');
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 500.w,
            width: 500.w,
          ),
        ),
      ),
    );
  }
}
