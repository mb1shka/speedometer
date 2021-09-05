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
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              children:[
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.support_agent_outlined),
                      Text("Support"),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
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
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.privacy_tip_outlined),
                        Text("Privacy Policy"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
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
              ]
          ),
        ),
      ]),
    );
  }
}
