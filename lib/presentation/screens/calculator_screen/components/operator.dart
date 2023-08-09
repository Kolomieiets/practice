class Operator {
  static bool isContain(String example) {
    return example.contains('*') ||
        example.contains('-') ||
        example.contains('*') ||
        example.contains('/');
  }

  static bool isOperator(String symbol) {
    final bool answer = (symbol == '*') ||
        (symbol == '/') ||
        (symbol == '+') ||
        (symbol == '-');
    return answer;
  }

  static String? findOperator(String example) {
    if (example.contains('*')) {
      return '*';
    } else if (example.contains('/')) {
      return '/';
    } else if (example.contains('+')) {
      return '+';
    } else if (example.contains('-')) {
      return '-';
    } else {
      return null;
    }
  }
}
