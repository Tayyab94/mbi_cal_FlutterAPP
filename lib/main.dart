import 'package:flutter/material.dart';
import 'package:mbi_cal/Screens/Result_Page.dart';
import 'Screens/INPUT_PAGE.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),

      ),
    //  home: Input_page(),
      initialRoute: '/',
      routes: {
        '/':(context)=>Input_page(),
        '/Second':(context)=>ResultPage(),
      },
    );
  }
}


