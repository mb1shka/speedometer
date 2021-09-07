import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedometer/widgets/bottom_bar.dart';

import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      //ChangeNotifierProvider наблюдает, что поменялось в нашем классе
      create: (context) => Data(),
        child: MaterialApp(
          title: "Speedometer",
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyWidget(), //да, боттомбар именно тут
        ),
    );
    /*return MaterialApp(
      title: "Speedometer",
        theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: MyWidget(), //да, боттомбар именно тут
    );*/
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyWidget();
}

class _MyWidget extends State<MyWidget> {
  //double speed = 0.0;
  //double highestSpeed = 0.0;

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

  /*@override
  void initState() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      _speedTracking(currentLocation);
    });
    super.initState();
  }*/

  void _speedTracking(BuildContext context, LocationData currentLocation) {
      double speed = currentLocation.speed!;

      context.read<Data>().changeSpeed(speed);

      /*if (speed > highestSpeed) {
        highestSpeed = speed;
      }*/
      //print("update speed $speed");
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

