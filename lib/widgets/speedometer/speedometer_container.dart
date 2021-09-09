import 'package:flutter/material.dart';
import 'package:speedometer/listeners/timer_listener.dart';
import 'package:speedometer/widgets/speedometer/speedometer.dart';
import 'package:provider/provider.dart';

import '../../listeners/speed_listener.dart';

class SpeedometerContainer extends StatefulWidget {
  @override
  _SpeedometerContainerState createState() => _SpeedometerContainerState();
}

class _SpeedometerContainerState extends State<SpeedometerContainer> {


  void _timeTracking() {
      context.read<TimerListener>().countDuration();
      context.read<SpeedListener>().countAVGSpeed();
      context.read<SpeedListener>().countDistance(context.watch<TimerListener>().getDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("HUD"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shadowColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            alignment: Alignment(-0.9, -0.9),
          ),
          Align(
            child: ElevatedButton(
              onPressed: () {
                _timeTracking();
              },
              child: Icon(Icons.refresh_outlined),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shadowColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            alignment: Alignment(0.9, -0.9),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 120),
            alignment: Alignment.bottomCenter,

            child: Text(
              "Time:\n${context.watch<TimerListener>().getDurationAsString}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            )
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 50),
            alignment: Alignment.bottomCenter,

            child: ElevatedButton(
              onPressed: () {
                _timeTracking();
              },
              child: Text("Start"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shadowColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            /*Text(
              "Highest speed:\n${context.watch<Data>().getHighestSpeed.toStringAsFixed(2)} mph",
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),*/
          ),
          Center(
            child: Speedometer(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 320),
            alignment: Alignment.topCenter,

            child: Text(
              "mph",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 200, 0.0, 0.0),
            alignment: Alignment.center,
            child: Text(
              "${context.watch<SpeedListener>().getSpeed.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.white, fontSize: 50),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
