import 'package:flutter/foundation.dart';

class SelectionHistory with ChangeNotifier {
  List<String> _history = [];

  List<String> get history => _history;

  void addItem(String item) {
    _history.add(item);
    notifyListeners();
  }
}
