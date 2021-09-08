import 'dart:async';

import 'package:flutter/cupertino.dart';

class Timer with ChangeNotifier{
  Duration _time = new Duration();

  Duration get getDuration => _time;
  //set setDuration(Duration duration) => _time = const Duration(microseconds: 0);

  DateTime startTime = DateTime.now();
  DateTime get getDateTime => startTime;

  StreamSubscription? _timer;
  final interval = const Duration(seconds: 1);

  void countDuration() {
    startTime = DateTime.now();
    _timer = Stream<void>.periodic(interval).listen((_) {
      DateTime currentTime = DateTime.now();
      Duration duration = currentTime.difference(startTime);
      _time = duration;
      notifyListeners();
    });
  }
}