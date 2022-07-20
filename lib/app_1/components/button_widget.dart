import 'package:flutter/material.dart';

import 'constants.dart';

class ButtomWidget extends StatelessWidget {
  ButtomWidget({required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(bottom: 20.0),
        // width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.width * .15,
      ),
    );
  }
}
