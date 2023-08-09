import 'package:practice_app/presentation/screens/calculator_screen/components/calculator_function.dart';
import 'package:practice_app/presentation/screens/calculator_screen/components/operator.dart';
import 'package:practice_app/presentation/screens/calculator_screen/components/simplify.dart';

class Parenthesis {
  static bool isContain(String example) {
    final bool answer = example.contains('(');
    return answer;
  }

  static String workWithParenthesis(String example) {
    List<String> myExample;
    String exWithoutSpace = '';
    String finalExample = '';
    int count = 0;

    if (isCorrectQuantity(example)) {
      exWithoutSpace = example.replaceAll(' ', '');
      myExample = exWithoutSpace.split('');

      for (int i = 0; i < exWithoutSpace.length; ++i) {
        if (exWithoutSpace[i] == '(' &&
            i > 0 &&
            !Operator.isOperator(exWithoutSpace[i - 1]) &&
            exWithoutSpace[i - 1] != '(') {
          myExample.insert(i + count, '*');
          count++;
        } else if (exWithoutSpace[i] == ')' &&
            i < exWithoutSpace.length - 1 &&
            !Operator.isOperator(exWithoutSpace[i + 1]) &&
            exWithoutSpace[i + 1] != ')') {
          myExample.insert(i + 1 + count, '*');
          count++;
        }
      }
    } else {
      return 'Parenthesis error';
    }
    finalExample = myExample.join();

    return finalExample;
  }

  static bool isCorrectQuantity(String example) {
    int open = 0;
    int close = 0;
    for (int i = 0; i < example.length; ++i) {
      if (example[i] == '(') {
        open++;
      } else if (example[i] == ')') {
        close++;
      }
      if (close > open) return false;
    }

    return open == close;
  }

  static List<String> simplifyParenthesis(String example) {
  List<String> exWithoutPar = [];
  String simplifiedExample = '';
  String? inPar = '';
  String correctEx = Parenthesis.workWithParenthesis(example);
  int open = 0;
  int close = 0;
  int? firstParIndex;

  if(correctEx != 'Parenthesis error') {
    for (int i = 0; i < correctEx.length; ++i) {
    if (correctEx[i] == '(') {
      if (open == 0) firstParIndex = i;
      open++;
    } else if (correctEx[i] == ')') {
      close++;
    } else if(firstParIndex == null ) {
      simplifiedExample += correctEx[i];
    }

    if (open == close && open > 0) {
      open = 0;
      close = 0;
      inPar = correctEx.substring(firstParIndex! + 1, i);
      inPar = CalculatorFunction.calculator(inPar);
      simplifiedExample += inPar!;
      firstParIndex = null;
    }
  }
  exWithoutPar = Simplify.makeIntegersList(simplifiedExample);
  return exWithoutPar;
  } return ['Parenthesis error'];
  
}
}