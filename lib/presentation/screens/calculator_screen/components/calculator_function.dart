import 'package:practice_app/presentation/screens/calculator_screen/components/bool_check.dart';
import 'package:practice_app/presentation/screens/calculator_screen/components/parenthesis.dart';
import 'package:practice_app/presentation/screens/calculator_screen/components/simplify.dart';

class CalculatorFunction {
  static double? smallCalculate(List<String> example) {
    double? answer;
    String operator = example[1];
    if (operator != 'error') {
      double firstInteger = double.parse(example[0]);
      double secondInteger = double.parse(example[2]);

      switch (operator) {
        case '*':
          return answer = firstInteger * secondInteger;
        case '/':
          return answer = firstInteger / secondInteger;
        case '-':
          return answer = firstInteger - secondInteger;
        case '+':
          return answer = firstInteger + secondInteger;
      }
    }

    return answer;
  }

  static String? calculator(String example) {
    example = example.replaceAll(' ', '');
    List<String> newEx = [];
    if (BoolCheck.isCorrect(example)) {
      if (example.contains('(')) {
        newEx = Parenthesis.simplifyParenthesis(example);

        if (newEx.contains('*') || newEx.contains('/')) {
          newEx = Simplify.simplifier(newEx.join().toString());
        }
      } else if (example.contains('*') || example.contains('/')) {
        newEx = Simplify.simplifier(example);
      } else {
        newEx = Simplify.makeIntegersList(example);
      }
      while (newEx.length > 2) {
        String firstInteger = newEx[0];
        String secondInteger = newEx[2];
        String operator = newEx[1];

        List<String> simple = [firstInteger, operator, secondInteger];
        double? answer = smallCalculate(simple);

        newEx.removeRange(0, 3);
        newEx.insert(0, '$answer');
      }
      return newEx.join().toString();
    } else {
      return 'example is incorrect';
    }
  }
}
