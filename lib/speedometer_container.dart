import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:speedometer/speedometer.dart';

class SpeedometerContainer extends StatefulWidget {
  @override
  _SpeedometerContainerState createState() => _SpeedometerContainerState();
}

class _SpeedometerContainerState extends State<SpeedometerContainer> {
  double velocity = 0;
  double highestVelocity = 0.0;

/*
  late StreamSubscription<Position> _positionStream;
  double _speed = 0.0;*/

  @override
  void initState() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      //TODO: ЭТУ ХРЕНЬ ПРИДЕТСЯ ПОМЕНЯТЬ НА СРАНЫЙ IOS
      _onAccelerate(event);
      //реагирует на скорость, но не на гравитацию
      //TODO: понять, будет ли учитываться скорость в движущемся объекте (транспорте, например)
    }); /*
    _positionStream =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high)
            .listen((position) {
      _onSpeedChange(position == null ? 0.0 : (position.speed * 18) / 5);
    });*/
    super.initState();
  }

/*  void _onSpeedChange(double newSpeed) {
    setState(() {
      _speed = newSpeed;
    });
  }

  @override
  void dispose() {
    _positionStream.cancel();
    super.dispose();
  }*/

  void _onAccelerate(UserAccelerometerEvent event) {
    print("${event.x} + ${event.y} + ${event.z}");
    double newVelocity =
    sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

    /*if ((newVelocity - velocity).abs() < 1) {
      return;
    } */

    setState(() {
      velocity = newVelocity /* * 1000 / 3600*/;
      if (velocity < 0.9) {
        velocity = 0.0;
      }

      if (velocity > highestVelocity) {
        highestVelocity = velocity;
      }
    });
  }



  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /*static const List<Widget> _pages = <Widget>[
    //MaterialPageRoute
  ]*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Speedometer"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer_outlined),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed_outlined),
            label: "Speedometer",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 70),
            //точно ли нужен const?? чекнуть потом, но вроде да, хотя stateful же, но хз короче
            alignment: Alignment.bottomCenter,

            child: Text(
              "Highest speed:\n${highestVelocity.toStringAsFixed(2)} km/h",
              style: const TextStyle(
                color: Colors.white,
                //снова const???
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Speedometer(
              speed: velocity,
              speedRecord: highestVelocity,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 200, 0.0, 0.0),
            alignment: Alignment.center,
            child: Text(
              "${velocity.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.white, fontSize: 50),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
