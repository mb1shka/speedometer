import 'dart:async';

import 'package:flutter/cupertino.dart';

class SpeedListener with ChangeNotifier {
  //цель этого класса - уведомлять слушателей, что в нем произошли какие-то изменения

  //State
  double _speed = 0.0;
  double _highestSpeed = 0.0;
  double _distance = 0.0;
  double _AVGSpeed = 0.0;
  //средняя скорость

  double _allCountedSpeed = 0.0;
  //сумма всех скоростей

  int counter = 1;
  //при каждом + скорости увеличивается counter

  //геттер скорости
  double get getSpeed => _speed;
  double get getHighestSpeed => _highestSpeed;
  double get getAVGSpeed => _AVGSpeed;
  double get getDistance => _distance;

  //таймер
  StreamSubscription? _timer;
  StreamSubscription? _distanceTimer;
  final interval = const Duration(milliseconds: 1);

  void changeSpeed(double newSpeed) {
    _speed = newSpeed;
    if (_speed > _highestSpeed) {
      _highestSpeed = _speed;
    }
    notifyListeners();
  }

  void countAVGSpeed() {
    _AVGSpeed = 0.0;
    counter = 1;
    _allCountedSpeed = 0.0;
    _timer = Stream<void>.periodic(interval).listen((event) {
      _allCountedSpeed = _allCountedSpeed + _speed;
      _AVGSpeed = _allCountedSpeed / counter;
      counter++;
      notifyListeners();
    });
  }

  void countDistance(Duration duration) {
    _distance = 0.0;
    _distanceTimer = Stream<void>.periodic(interval).listen((event) {
      _distance = (duration * _AVGSpeed) as double;
      //TODO: неправильно считает дистанцию. перевести длительность правильно в тип double и пересчитать
      notifyListeners();
    });
  }

}