import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderID extends StatelessWidget {
  final String orderID;
  OrderID({
    required this.orderID,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '#$orderID',
        style: TextStyle(
          fontSize: 40.ssp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
