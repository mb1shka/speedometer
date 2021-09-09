import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerListener with ChangeNotifier{
  Duration _time = new Duration();
  String _formatTime = " ";

  Duration get getDuration => _time;
  String get getDurationAsString => _formatTime;

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
      _formatTime = _time.toString().substring(0,7);
      notifyListeners();
    });
  }
}