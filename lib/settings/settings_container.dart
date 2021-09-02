import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatefulWidget {
  @override
  _SettingsContainerState createState() => _SettingsContainerState();
}

class _SettingsContainerState extends State<SettingsContainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Settings",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey,
        ),
        body: const Center(
          child: BaseUnitClass(),
        ),
      ),
    );
  }
}

enum BaseUnit { mph, kmh }

class BaseUnitClass extends StatefulWidget {
  const BaseUnitClass({Key? key}) : super(key: key);

  @override
  State<BaseUnitClass> createState() => _BaseUnitState();
}

class _BaseUnitState extends State<BaseUnitClass> {
  BaseUnit? _baseUnit = BaseUnit.mph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: <Widget>[
        ListTile(
          title: const Text("mph",
            style: TextStyle(
                color: Colors.white,
            ),
          ),
          leading: Radio<BaseUnit>(
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              value: BaseUnit.mph,
              groupValue: _baseUnit,
              onChanged: (BaseUnit? value) {
                setState(() {
                  _baseUnit = value;
                });
              }),
        ),
        ListTile(
          title: const Text("km/h",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Radio<BaseUnit>(
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              value: BaseUnit.kmh,
              groupValue: _baseUnit,
              onChanged: (BaseUnit? value) {
                setState(() {
                  _baseUnit = value;
                });
              }),
        ),
      ]),
    );
  }
}
