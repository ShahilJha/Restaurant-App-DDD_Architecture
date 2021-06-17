import 'package:flash/flash.dart';
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
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {
            //none()
          },
          //some()
          (either) => either.fold(
            //AuthFailures
            (failure) {
              showFlash(
                context: context,
                duration: const Duration(seconds: 3),
                builder: (context, controller) {
                  return Flash.bar(
                    controller: controller,
                    backgroundColor: Theme.of(context).primaryColor,
                    enableVerticalDrag: true,
                    horizontalDismissDirection:
                        HorizontalDismissDirection.horizontal,
                    position: FlashPosition.bottom,
                    margin: const EdgeInsets.all(8),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    forwardAnimationCurve: Curves.easeOutBack,
                    reverseAnimationCurve: Curves.slowMiddle,
                    child: FlashBar(
                      content: Text(
                        failure.map(
                          cancelledByUser: (_) => 'Cancelled',
                          serverError: (_) => 'Server Error',
                          emailAlreadyInUse: (_) => 'Email Already in Use',
                          invalidEmailAndPasswordCombination: (_) =>
                              'Invalid Email and Password Combination',
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              );
            },
            //Unit()
            (_) {
              //Navigation
            },
          ),
        );
      },
      builder: (context, state) {
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
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.mail),
                            // suffixIcon: //condition
                            //     ? Container(width: 0)
                            //     : IconButton(
                            //         icon: Icon(Icons.close),
                            //         onPressed: () =>
                            //             context.read<SignInFormBloc>().add(
                            //                   const SignInFormEvent
                            //                       .clearEmailAddress(),
                            //                 ),
                            //       ),
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
                          obscureText: state.obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: IconButton(
                              icon: state.obscurePassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                context.read<SignInFormBloc>().add(
                                    SignInFormEvent.togglePasswordObscurity(
                                        state.obscurePassword));
                              },
                            ),
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Checkbox(
                      //       value: _rememberMe,
                      //       onChanged: (value) {},
                      //     ),
                      //     Text(
                      //       "Remember Me?",
                      //     ),
                      //   ],
                      // ),
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
                AppButton(
                  text: 'Log-in By Google',
                  onPressed: () {
                    context.read<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGooglePressed(),
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
