import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function() onPressed;

  const AppButton({
    Key? key,
    required this.text,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.w, horizontal: 25.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color ?? Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 50.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 60.w,
            ),
          ),
        ),
      ),
    );
  }
}
