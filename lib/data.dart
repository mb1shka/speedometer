import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
  //цель этого класса - уведомлять слушателей, что в нем произошли какие-то изменения

  //State
  double _speed = 0.0;
  double _highestSpeed = 0.0;

  //геттер скорости
  double get getSpeed => _speed;
  double get getHighestSpeed => _highestSpeed;

  void changeSpeed(double newSpeed) {
    _speed = newSpeed;
    if (_speed > _highestSpeed) {
      _highestSpeed = _speed;
    }
    notifyListeners();
  }

}