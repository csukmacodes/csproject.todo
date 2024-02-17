import 'package:flutter/material.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 08:37:27
/// project : todo

class TaskController with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
