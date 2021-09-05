import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedometer/widgets/settings/settings_container.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SettingsContainer(),
    );
  }

}