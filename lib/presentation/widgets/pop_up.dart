import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_button.dart';

class PopUp extends StatelessWidget {
  final String title;
  final String message;

  const PopUp({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
      elevation: 10,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
      children: [
        Text(message, textAlign: TextAlign.center),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 100.w),
          child: AppButton(
            text: 'Close',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
