import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clikcs = 0;

  void _increase() {
    setState(() {
      _clikcs++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_clikcs', style: const TextStyle(fontSize: 30)),
          ElevatedButton(onPressed: _increase, child: const Text('Increase'))
        ],
      ),
    );
  }
}
