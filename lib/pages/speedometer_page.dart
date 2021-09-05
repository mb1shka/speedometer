import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedometer/widgets/speedometer/speedometer_container.dart';

class SpeedometerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(/*
      appBar: new AppBar(*//*
      //AppBar is not needed! Cause we don't have a word combination here!
        title: new Text("Speedometer"),*//*
      ),*/
      body: SpeedometerContainer(),
    );
  }

}