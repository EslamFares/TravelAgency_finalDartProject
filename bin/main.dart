import 'dart:io';
import 'helper_functions/executeFunctions.dart';
import 'helper_functions/allFunNames.dart';

void main(List<String> arguments) {
  var again = true;
  int functionNum;

  allFunNames();

  do {
    try {
      print('Enter num to choose function ... ');
      functionNum = int.parse(stdin.readLineSync());
      if (functionNum < 9) again = false;
    } catch (e) {
      print('!!! Enter Correct Data, Please....');
    }
  } while (again == true);

  executeFun(functionNum);
}
