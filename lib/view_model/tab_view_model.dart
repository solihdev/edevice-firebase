import 'package:flutter/foundation.dart';

class TabViewModel extends ChangeNotifier {
  int activePageIndex = 0;

  void chanePageIndex(int newIndex) {
    activePageIndex = newIndex;
    notifyListeners();
  }
}
