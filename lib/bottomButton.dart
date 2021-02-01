import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  @override
  BottomButton({@required this.buttonTitle, @required this.onTap});
  final Function onTap;
  final String buttonTitle;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle
          ),
        ),
        color: kBottomWidgetColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomHeight,
      ),
    );
  }
}