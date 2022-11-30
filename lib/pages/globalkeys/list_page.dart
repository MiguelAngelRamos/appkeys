import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {

          //* Construcción de una lista de elementos
          final listView = ListView.builder(
            key: listKey,
            itemBuilder: (context, index) {
              return ListTile(title: Text('$index'));
            },
            itemCount: 1000,
          );
          if(orientation == Orientation.portrait) {
            return Column(
              children: [
                const SizedBox(height: 10),
                const Text('PORTRAINT', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Expanded(
                  child: listView
                )
              ]
            );
          }
          return Row(
            children: [
              Expanded(child: Text('LANDSCAPE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              Expanded(child: listView)
            ],
          );

        },
      )
    );
  }
}
