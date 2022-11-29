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
         //! si comentamos esta linea va surgir un cambio, perderemos la animación
        //! Esto se debe a que solo cambia el texto y no lo detecta como un nuevo widget
        //! antes teniamos una condicional ternaria y eso alternava entre 2 widgets por la condición y es por eso que podiamos ver la animación de un nuevo widget entrando cada vez que las condiciones cambiaban
          child: Text(
            // key: ValueKey<String>(_counter.toString()),
            key: Key(_counter.toString()), //* con esto hacemos diferente a cada widget de tipo Text
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

 