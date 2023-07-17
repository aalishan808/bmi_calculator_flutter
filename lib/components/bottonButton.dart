import 'package:flutter/material.dart';
import '../constants.dart';
class bottonButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  bottonButton( {required this.onTap, required this.buttonTitle});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        child: Center(child: Text(buttonTitle,style:
        kLargeButtonTextStyle ,)),

        color: KBottonColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottonHeightConatiner,
      ),
    );
  }
}
