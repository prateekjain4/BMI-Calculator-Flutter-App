import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  // final makes this property immutable, it means that when we create a new reusable card, we can set the color and we cant change it again
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(label, style: kLabelTextStyle,)
        ]
    );
  }
}