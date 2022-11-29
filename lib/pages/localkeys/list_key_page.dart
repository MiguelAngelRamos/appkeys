import 'package:flutter/material.dart';
import 'package:keysapp/widgets/uselocalkeys/counter_button.dart';

class ListKeyPage extends StatefulWidget {
  const ListKeyPage({super.key});

  @override
  State<ListKeyPage> createState() => _ListKeyPageState();
}

class _ListKeyPageState extends State<ListKeyPage> {

  bool _enabledEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Switch(
            value: _enabledEmail,
            onChanged: (value) {
              setState(() {
                _enabledEmail = value;
              });
            },
          )
        ]
      ),
      // body: Center(child: Text('$_enabledEmail', style: TextStyle(fontSize: 45)))
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if(_enabledEmail)
          const TextField(
            key: Key('emailkey'),
            decoration: InputDecoration(
              label: Text('Email')
            ),
          ),
          const TextField(
            key: Key('passwordkey'),
            decoration: InputDecoration(
              label: Text('Password')
            ),
          ),
          const SizedBox(height: 10),
          if(_enabledEmail)
          CounterButton(
            key: Key('contador1')
          ),
          const SizedBox(height: 10),
          CounterButton(
            key: Key('contador2')
          ),
        ],
      )
    );
  }
}