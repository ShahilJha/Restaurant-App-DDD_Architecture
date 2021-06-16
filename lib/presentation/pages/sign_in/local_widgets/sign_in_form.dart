import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/presentation/widgets/app_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {},
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildEmail(),
                      _buildPassword(),
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmail() => Container(
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
        ),
      );

  Widget _buildPassword() => Container(
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
        ),
      );
}
