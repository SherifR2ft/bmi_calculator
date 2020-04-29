import 'package:flutter/material.dart';
import 'k_constants.dart';
class BottomButton extends StatelessWidget {
  const BottomButton({@required this.onTap, @required this.label});
  final Function onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(child: Text(label, style: kLargeButtonTextStyle)),
      ),
    );
  }
}
