import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'k_constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.gender});
  final String gender;
  IconData iconGender;


  @override
  Widget build(BuildContext context) {

    gender == 'male'?iconGender = FontAwesomeIcons.mars:
    iconGender = FontAwesomeIcons.venus;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Icon(
            iconGender,

              size: 80.0,
          ),
//
        ),
        Expanded(
          flex: 1,
          child: Text(
            gender,
            style: kLabelTextStyle,
          ),
        )
      ],
    );
  }
}
