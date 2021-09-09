import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../listeners/speed_listener.dart';
import '../../listeners/timer_listener.dart';

class StatisticsContainer extends StatefulWidget {
  @override
  _StatisticsContainerState createState() => _StatisticsContainerState();
}

class _StatisticsContainerState extends State<StatisticsContainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Statistics",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey,
        ),
        body: const Center(
          child: SettingsWidget(),
        ),
      ),
    );
  }
}

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: Colors.black,
          margin: EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Distance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "${context.watch<SpeedListener>().getDistance} mi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(" ",
                style: TextStyle(fontSize: 40),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.access_time_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Duration",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "${context.watch<TimerListener>().getDurationAsString}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(" ",
                  style: TextStyle(fontSize: 40),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.speed_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Top Speed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "${context.watch<SpeedListener>().getHighestSpeed.toStringAsFixed(2)} mph",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(" ",
                  style: TextStyle(fontSize: 40),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.speed_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "AVG Speed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "${context.watch<SpeedListener>().getAVGSpeed.toStringAsFixed(2)}mph",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
