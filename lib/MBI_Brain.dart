
import 'dart:math';
class BMIBrain
{
  BMIBrain({this.height,this.weight});

  final int height;
  final int weight;

  double _bmi=0;

  String calculateBmi()
  {
    _bmi=weight/pow(height/100, 2);

    return _bmi.toStringAsFixed(1);
  }



  String getResult()
  {
    if(_bmi >= 30.0)
      {
        return 'Overweight';
      }
    else if(_bmi >= 18.5)
      {
        return 'Normal';
      }
    else
      {
        return 'UnderWeight';
      }
  }


  String Get_interpretation ()
  {
    if(_bmi >= 30) {
      return 'You have higher than normal body weight, try to Exercise more.!';
    }
    else if(_bmi >= 18.5)
      {
        return 'You have perfect body weight, Good Job.!';
      }
    else {
      return 'You have lesser than normal body weight, try to EAT more.!';
    }
  }
}
