import 'package:flutter/material.dart';



class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onpress});
  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpress,
      elevation: 5.5,
      constraints: BoxConstraints.tightFor(width: 40.0, height: 44.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5e),
    );
  }
}