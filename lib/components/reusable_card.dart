import 'package:flutter/material.dart';

class reusable_card extends StatelessWidget {
  reusable_card({required this.color_, required this.cardchild,required this.onPress});

  final Color color_;
  final Widget cardchild;
 final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color_,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
