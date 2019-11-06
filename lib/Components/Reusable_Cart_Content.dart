import 'package:flutter/material.dart';
import 'package:mbi_cal/Components/Reusable_Cart_Content.dart';

class ReusableCart extends StatelessWidget {
  ReusableCart({@required this.rang, this.childCart,this.onPress});
  final Color rang;
  final Widget childCart;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCart,
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: rang,
        ),
      ),
    );
  }
}
