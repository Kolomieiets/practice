class DictionaryChartScreen {
  late final String _title;
  late final String _lineTitle;
  late final String _lineRehomed;
  late final String _lineFostered;
  late final String _lineReceived;
  late final String _lineEuthanasia;
  late final String _barTitle;
  late final String _barOwn;
  late final String _barNever;
  late final String _barUsedTo;
  late final String _barPlanned;
  late final String _pieTitle;
  late final String _pieNone;
  late final String _pieOneCat;
  late final String _pieTwoCats;
  late final String _pieThreeCats;

  DictionaryChartScreen({required Map<String, String> chartScreen}) {
    _title = chartScreen['title'] ?? '';
    _lineTitle = chartScreen['line_title'] ?? '';
    _lineRehomed = chartScreen['line_rehomed'] ?? '';
    _lineFostered = chartScreen['line_fostered'] ?? '';
    _lineReceived = chartScreen['line_received'] ?? '';
    _lineEuthanasia = chartScreen['line_euthanasia'] ?? '';
    _barTitle = chartScreen['bar_title'] ?? '';
    _barOwn = chartScreen['bar_own'] ?? '';
    _barNever = chartScreen['bar_never'] ?? '';
    _barUsedTo = chartScreen['bar_usedto'] ?? '';
    _barPlanned = chartScreen['bar_planned'] ?? '';
    _pieTitle = chartScreen['pie_title'] ?? '';
    _pieNone = chartScreen['pie_none'] ?? '';
    _pieOneCat = chartScreen['pie_one_cat'] ?? '';
    _pieTwoCats = chartScreen['pie_two_cats'] ?? '';
    _pieThreeCats = chartScreen['pie_three_or_more'] ?? '';
  }

  String get title => _title;
  String get lineTitle => _lineTitle;
  String get lineRehomed => _lineRehomed;
  String get lineFostered => _lineFostered;
  String get lineReceived => _lineReceived;
  String get lineEuthanasia => _lineEuthanasia;
  String get barTitle => _barTitle;
  String get barOwn => _barOwn;
  String get barNever => _barNever;
  String get barUsedTo => _barUsedTo;
  String get barPlanned => _barPlanned;
  String get pieTitle => _pieTitle;
  String get pieNone => _pieNone;
  String get pieOneCat => _pieOneCat;
  String get pieTwoCats => _pieTwoCats;
  String get pieThreeCats => _pieThreeCats;
}
