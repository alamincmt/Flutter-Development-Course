import 'dart:ffi';
import 'dart:html';
import 'dart:html_common';

void main(){
  print("Hello Dart...");

  // single line comment

  int hugeNumber = -4645645435435435435;
  double dValue = 454099998098989877878778878778787.0;

  print(dValue);

  dynamic text = "This is text";
  print("text value is: " + text);
  text = 'S';
  print("text value is: " + text);

  double abc = 500.200;
  abc = 4654;

  int num1 = 23234+3434;
  int mark = 10;

  mark += 50;
  if(mark >= 80){
    print("A+");
  }else if(mark < 33){
    print("Ahh Failed!");
  }

  print(mark is int);

  var a = 10;
  var res = a > 12 ? "value greater than 10":"value lesser than or equal to 10";
  print(res);

  String name = "Al-Amin";
  print("Teacher name is: " + name);

  List numberList = [4,45,5,45,45];
  for(int i=0; i<numberList.length; i++){
    print("number $numberList[$i]");
  }


}

/*
int addTwoNumber(int num1, int num2){
  return num1 + num2;
}*/
