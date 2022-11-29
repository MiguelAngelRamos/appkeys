import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    print('ejecutando build');
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          duration: const Duration(milliseconds: 200),
          // child: _counter % 2 == 0 ?
          //       const CircularProgressIndicator():
          //       Text(_counter.toString(), style: const TextStyle(fontSize: 50))
          child: Text(
            // key: ValueKey<String>(_counter.toString()),
            key: Key(_counter.toString()),
            _counter.toString(), 
            style: const TextStyle(fontSize: 50)
            )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
            //* recordemos que el setState vuelve a llamar al método build
          });
        },
      ),
    );
  }
}

//* AnimatedSwitcher anima un "nuevo widget"
//* asegurarnos siempre que nuestros widgets secundarios tengan una clave(key)