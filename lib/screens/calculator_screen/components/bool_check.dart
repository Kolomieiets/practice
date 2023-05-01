import 'package:practice_app/screens/calculator_screen/components/operator.dart';
import 'package:practice_app/screens/calculator_screen/components/parenthesis.dart';

class BoolCheck {
  static bool isDigit(String? symbol) {
    if (symbol == null) return false;
    int letterCode = symbol.codeUnitAt(0);
    return (letterCode >= 48 && letterCode <= 57) || symbol == '.';
  }

  static bool isCorrect(String string) {
    bool correctPar = true;
    for (int i = 0; i < string.length; ++i) {
      String symbol = string[i];
      int letterCode = string.codeUnitAt(i);
      bool notDigit = letterCode < 48 || letterCode > 57;
      bool notOperator = letterCode < 40 ||
          letterCode > 43 && letterCode < 45 ||
          letterCode > 47;

      if (string == '') return false;

      if (Operator.isOperator(symbol) &&
          Operator.isOperator(string[i + 1]) &&
          string[i + 1] != '-') {
        return false;
      }

      if ((Operator.isOperator(string[0]) && string[0] != '-') ||
          (Operator.isOperator(string[0]) && string[1] == '(')) {
        return false;
      }

      if (string[i] == '(' &&
          (string[i + 1] != '-' && Operator.isOperator(string[i + 1]))) {
        return false;
      }

      if (notDigit && notOperator) {
        return false;
      }
    }

    if (string.contains('(') || string.contains(')')) {
      correctPar = Parenthesis.isCorrectQuantity(string);
    }
    return correctPar;
  }
}
