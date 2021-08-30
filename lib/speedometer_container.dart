import 'dart:async';/*
import 'dart:math';*/
import 'package:flutter/material.dart';/*
import 'package:sensors/sensors.dart';*/
import 'package:speedometer/speedometer.dart';
import 'package:location/location.dart';

class SpeedometerContainer extends StatefulWidget {
  @override
  _SpeedometerContainerState createState() => _SpeedometerContainerState();
}

class _SpeedometerContainerState extends State<SpeedometerContainer> {
  double speed = 0.0;
  double highestSpeed = 0.0;

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

  void _speedTracking(LocationData currentLocation) {
    setState(() {
      speed = currentLocation.speed!;
      if (speed > highestSpeed) {
        highestSpeed = speed;
      }
    });
  }

  @override
  void initState() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      _speedTracking(currentLocation);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 70),
            alignment: Alignment.bottomCenter,

            child: Text(
              "Highest speed:\n${highestSpeed.toStringAsFixed(2)} m/s",
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Speedometer(
              speed: speed,
              speedRecord: highestSpeed,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 200, 0.0, 0.0),
            alignment: Alignment.center,
            child: Text(
              "${speed.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.white, fontSize: 50),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
