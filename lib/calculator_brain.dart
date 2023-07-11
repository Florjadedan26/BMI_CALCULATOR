import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

    String calculatorBMI (){
       _bmi = weight / pow(height / 100, 2);
      return _bmi.toStringAsFixed(1);
    }

    String getResult(){
      if (_bmi >= 25){
        return 'Over-Weight';
      } else if(_bmi > 18.5) {
        return 'Normal';
      } else {
        return 'Under-Weight';
      }

    }
    String getInterpretation(){
     if (_bmi >= 25){
      return 'You are over-weight, you need to Exercise and stop eating junk food';
    } else if(_bmi > 18.5) {
      return 'you have normal weight, be careful on your eating habit because if you eat more and get overweight but if  less you get underweight  ';
    } else {
      return 'Man you need to eat more if you want to long life';
    }

  }




}