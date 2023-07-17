import 'package:flutter/material.dart';

import '../constants.dart';
class icon_context extends StatelessWidget {
  icon_context({
    required this.icon,required this.label
  });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label,
        style: kLabelTextStyle,
        )
      ],
    );
  }
}