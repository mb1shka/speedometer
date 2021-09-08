import 'dart:async';

import 'package:speedometer/timer.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedometer/widgets/bottom_bar.dart';

import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Data>(create: (context) => Data()),
        ChangeNotifierProvider<Timer>(create: (context) => Timer()),
        ],
      child: MaterialApp(
        title: "Speedometer",
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyWidget(), //да, боттомбар именно тут
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyWidget();
}

class _MyWidget extends State<MyWidget> {

  Location location = new Location();

  //НОВЫЙ ВАРИАНТ С БИБЛИОТЕКОЙ ЛОКАЦИИ

  Future<void> _serviceEnabled() async {
    //In order to request location, you should always check Location Service status and Permission status manually
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    //here we make sure the location service is enabled
    //by checking serviceEnabled

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    //here we are asking for permission to get the device's location

    _locationData = await location.getLocation();
    //contains data about the device's location, including speed in meters/second
  }

  //ТУТ ИЗМЕНЕНИЕ СКОРОСТИ И МАКСИМАЛЬНОЙ СКОРОСТИ
  void _speedTracking(BuildContext context, LocationData currentLocation) {
      double speed = currentLocation.speed!;
      context.read<Data>().changeSpeed(speed);
  }


  @override
  Widget build(BuildContext context) {
    location.onLocationChanged.listen((LocationData currentLocation) {
      _speedTracking(context, currentLocation);
    });
    return Scaffold(
        body: BottomBar(),
    );
  }

}

