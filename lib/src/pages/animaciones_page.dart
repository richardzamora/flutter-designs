import 'package:flutter/material.dart';
import 'dart:math';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> moveRight;
  late Animation<double> enlarge;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 4 * pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1, curve: Curves.easeOutExpo)));
    moveRight = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    enlarge = Tween(begin: 2.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
        //controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, child) {
        return Opacity(
            opacity: opacity.value,
            //El orden de arbol de widgets cambia la animación. ej: si el translate
            // es hijo de scale, es un efecto bummerang o si translate es hijo de
            //rotate es un efecto circular.
            //  No hay cambios al mover el scale y el rotate entre sí
            child: Transform.scale(
              scale: enlarge.value,
              child: Transform.translate(
                  offset: Offset(moveRight.value, 0),
                  child: Transform.rotate(
                    angle: rotation.value,
                    child: _Rectangulo(),
                  )),
            ));
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
