import 'package:flutter/material.dart';
import 'package:mbi_cal/Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.btnText,@required this.onpress});
  final String btnText;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Center(child: Text(btnText,style: kLargeButtonTextStyle,),),
        margin: EdgeInsets.only(top: 7.8),
        padding: EdgeInsets.only(bottom: 12.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
      ),
    );
  }
}