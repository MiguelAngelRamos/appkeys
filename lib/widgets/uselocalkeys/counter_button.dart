import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 3,
        backgroundColor: Colors.indigoAccent
        ),
      onPressed: () {
        setState(() {
          _counter++;
        });
      },
      child: Text(_counter.toString(), style: const TextStyle(fontSize: 35),),
    );
  }
}