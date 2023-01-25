import 'package:flutter/cupertino.dart';

class EmojisVisibleNotifier extends ChangeNotifier {
  bool visible = false;

  showEmojis() {
    visible = true;
    notifyListeners();
  }

  hideEmojis() {
    visible = false;
    notifyListeners();
  }
}
