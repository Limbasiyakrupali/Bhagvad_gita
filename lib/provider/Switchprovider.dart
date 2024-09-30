import 'package:flutter/material.dart';

class Switchprovider extends ChangeNotifier {
  bool istapped = false;

  void Changetheme() {
    istapped = !istapped;
    notifyListeners();
  }
}
