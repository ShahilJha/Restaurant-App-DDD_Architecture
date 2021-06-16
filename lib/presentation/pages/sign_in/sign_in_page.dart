import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:restaurant_app/injection.dart';
import 'package:restaurant_app/presentation/pages/sign_in/local_widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInForm(),
      ),
    );
  }
}
