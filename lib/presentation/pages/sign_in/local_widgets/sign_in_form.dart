import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:restaurant_app/presentation/widgets/app_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        print('LOG-IN PAGE: ${state.showErrorMessages}');
        return SingleChildScrollView(
          child: SizedBox(
            height: 2280.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 500.w,
                  width: 500.w,
                ),
                Form(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 100.w),
                        margin: EdgeInsets.symmetric(vertical: 25.w),
                        child: TextFormField(
                          autofocus: true,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail),
                          ),
                          onChanged: (value) => context
                              .read<SignInFormBloc>()
                              .add(SignInFormEvent.emailChanged(value)),
                          validator: (_) => context
                              .read<SignInFormBloc>()
                              .state
                              .emailAddress
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  invalidEmail: (_) => 'Invalid Email',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 100.w),
                        margin: EdgeInsets.symmetric(vertical: 25.w),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.vpn_key),
                          ),
                          onChanged: (value) => context
                              .read<SignInFormBloc>()
                              .add(SignInFormEvent.passwordChanged(value)),
                          validator: (_) => context
                              .read<SignInFormBloc>()
                              .state
                              .password
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  shortPassword: (_) => 'Short Password',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              ),
                        ),
                      ),
                      // OccupationChips(
                      //   position: jobPosition,
                      //   onPressed: (position) {
                      //     setState(() {
                      //       jobPosition = position;
                      //     });
                      //   },
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Checkbox(
                          //   value: _rememberMe,
                          //   onChanged: (value) {},
                          // ),
                          Text(
                            "Remember Me?",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AppButton(
                  text: 'Log-in',
                  onPressed: () {
                    context.read<SignInFormBloc>().add(
                          const SignInFormEvent
                              .signInWithEmailAndPasswordPressed(),
                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
