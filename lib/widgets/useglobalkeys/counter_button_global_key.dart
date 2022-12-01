import 'package:flutter/material.dart';

class CounterButtonGlobalKey extends StatefulWidget {
  const CounterButtonGlobalKey({super.key});

  @override
  State<CounterButtonGlobalKey> createState() => CounterButtonGlobalKeyState();
}

class CounterButtonGlobalKeyState extends State<CounterButtonGlobalKey> {
  int _counter = 0;

  //* Método para resetear el contador
  void reset() {
    setState(() {
      _counter = 0;
    });
  }
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