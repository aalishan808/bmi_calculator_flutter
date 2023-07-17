import 'dart:math';
class calculateBMI{

 double bmi=1;
 final int height;
 final int weight;
 calculateBMI({ required this.height,required this.weight});

  String calculateBmi( ){
    bmi = weight/ pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(bmi>=25){
      return "overweight";
    }
    else if(bmi>18.5 && bmi<25){
      return "normal";
    }
    else{
    return "underweight";
    }
  }
  String getInterpretation(){
    if(bmi>=25){
      return "You have higher body weight, Try diet and exercise.";
    }
    else if(bmi>18.5 && bmi<25){
      return "Congratulations! you have normal body weight. ";
    }
    else {
      return "You have low body weight, you should increase your calories intake.";
    }
  }
}