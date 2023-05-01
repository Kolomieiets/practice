import 'package:practice_app/screens/calculator_screen/components/bool_check.dart';
import 'package:practice_app/screens/calculator_screen/components/calculator_function.dart';
import 'package:practice_app/screens/calculator_screen/components/operator.dart';

class Simplify {
  static List<String> simplifier(String example) {
    List<String> integersList = makeIntegersList(example);
    List<String> simple = [];
    double? answer;

    do {
      for (int i = 0; i < integersList.length; ++i) {
        if (integersList[i] == '*' || integersList[i] == '/') {
          simple = [integersList[i - 1], integersList[i], integersList[i + 1]];
          answer = CalculatorFunction.smallCalculate(simple);
          integersList.replaceRange(i - 1, i + 2, ['$answer']);
          i - 1;
        }
      }
    } while (integersList.contains('*') || integersList.contains('/'));

    return integersList;
  }

  static List<String> makeIntegersList(String example) {
    List<String> newEx = [];
    String helper = '';

    for (int i = 0; i < example.length; ++i) {
      String symbol = example[i];
      String? nextSymbol;
      String? previousSymbol;

      if (i != 0) previousSymbol = example[i - 1];
      if (i != example.length - 1) nextSymbol = example[i + 1];

      bool middle = previousSymbol != null && nextSymbol != null;
      bool betweenDigits = BoolCheck.isDigit(previousSymbol) && BoolCheck.isDigit(nextSymbol);

      if (BoolCheck.isDigit(symbol)) {
        if (nextSymbol == null ||
            (Operator.isOperator(nextSymbol))) {
          helper += symbol;
          newEx.add(helper);
          helper = '';
        } else if (previousSymbol == null) {
          helper += symbol;
        } else {
          helper += symbol;
        }
      } else if (Operator.isOperator(symbol)) {
        if (middle && (betweenDigits || Operator.isOperator(nextSymbol))) {
          newEx.add(symbol);
        } else if (previousSymbol == null ||
            Operator.isOperator(previousSymbol)) {
          helper += symbol;
        }
      }
    }
    return newEx;
  }
}
