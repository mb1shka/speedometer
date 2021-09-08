import 'dart:async';

import 'package:flutter/cupertino.dart';

class Timer with ChangeNotifier{
  Duration _time = new Duration();
  String _formatTime = " ";

  String get getDuration => _formatTime;
  //set setDuration(Duration duration) => _time = const Duration(microseconds: 0);

  DateTime startTime = DateTime.now();
  DateTime get getDateTime => startTime;

  StreamSubscription? _timer;
  final interval = const Duration(seconds: 1);

  //format(Duration duration) => duration.toString().substring(0,7);

  void countDuration() {
    startTime = DateTime.now();
    _timer = Stream<void>.periodic(interval).listen((_) {
      DateTime currentTime = DateTime.now();
      Duration duration = currentTime.difference(startTime);
      _time = duration;
      _formatTime = _time.toString().substring(0,7);
      notifyListeners();
    });
  }
}