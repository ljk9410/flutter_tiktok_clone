import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;

  void _onChangedNotification(bool? newValue) {
    if (newValue == null) return;

    setState(() => _notification = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            CupertinoCheckbox(
              value: _notification,
              onChanged: _onChangedNotification,
            ),
            ListTile(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
              },
              title: const Text('What is your birthday?'),
            ),
            const AboutListTile()
          ],
        ));
  }
}
