import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: Text("Statistics",
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
        color: Colors.grey,
        margin: EdgeInsets.only(left: 20.0,top: 10.0, right: 20.0),
          child: Wrap(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined),
                  Text("Distance",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text("0 mi"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_outlined),
                  Text("Duration",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text("00:00:00"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.speed_outlined),
              Text("Highest Speed",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text("0.00 mph"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.speed_rounded),
              Text("AVG Speed",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text("0.00 mph"),
            ],
          ),
          ],
        ),
      )
    );
  }

}