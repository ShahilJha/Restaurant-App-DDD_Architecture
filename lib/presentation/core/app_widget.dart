import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/application/auth/auth_bloc.dart';
import 'package:restaurant_app/injection.dart';
import 'package:restaurant_app/presentation/core/app_theme.dart';
import 'package:restaurant_app/presentation/routes/router.gr.dart' as appRoute;

class AppWidget extends StatelessWidget {
  final _router = appRoute.Router();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(AuthEvent.authCheckRequested()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Restaurant Application',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.generateThemeData(),
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
          // home: SplashPage(),
        ),
      ),
    );
  }
}
