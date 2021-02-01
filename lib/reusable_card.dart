import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  // final makes this property immutable, it means that when we create a new reusable card, we can set the color and we cant change it again
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPress,
      child: Container(

        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}