import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mbi_cal/Components/Reusable_Cart_Content.dart';
import '../Constants.dart';
import '../Components/Reusable_Cart_Content.dart';
import '../Components/Button_Bottom.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText, @required this.ResultSuggestion});
 final String bmiResult;

final String resultText;
final String ResultSuggestion;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Cal'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCart(
              rang: kActiveCartColor,
              childCart: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: KResutTextStyle,
                  ),
                  Text(
                    resultText,
                    style: kMBITextStyle,
                  ),
                  Text(ResultSuggestion,style:kBMIBodyStyle ,textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          BottomButton(btnText: 'Back Page',onpress: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
