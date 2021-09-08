import 'dart:async';

class Timer {
  late Duration _time;

  Duration get getDuration => _time;

  DateTime startTime = DateTime.now();

  StreamSubscription? _timer;
  final interval = const Duration(seconds: 1);

  void countDuration() {
    _timer = Stream<void>.periodic(interval).listen((_) {
      DateTime currentTime = DateTime.now();
      Duration duration = currentTime.difference(startTime);
      _time = duration;
    });
  }
}