import 'package:flutter/material.dart';
import 'package:keysapp/widgets/useglobalkeys/counter_button_global_key.dart';

class MovableWidget extends StatefulWidget {

  const MovableWidget({super.key});

  @override
  State<MovableWidget> createState() => _MovableWidgetState();
}

class _MovableWidgetState extends State<MovableWidget> {

  bool _inBody = true;
  final globalKeyCounter = GlobalKey<CounterButtonGlobalKeyState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: !_inBody ? CounterButtonGlobalKey(key: globalKeyCounter): null,
        backgroundColor: Colors.black87,
        actions: [
          TextButton(
            onPressed: () {
              globalKeyCounter.currentState?.reset();
            },
            child: const Text('RESET'),
          ),
          Switch(
            value: _inBody, 
            onChanged: (value) {
              setState(() {
                _inBody = value;
              });
            },
            )
        ]
      ),
      body: _inBody ? CounterButtonGlobalKey(key: globalKeyCounter): null
    );
  }
}