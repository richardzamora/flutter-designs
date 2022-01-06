import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  final gradient;
  const RadialProgress(
      {Key? key,
      required this.porcentaje,
      this.colorPrimario = Colors.pink,
      this.colorSecundario = Colors.grey,
      this.grosorPrimario = 10,
      this.grosorSecundario = 4,
      this.gradient})
      : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    super.initState();

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
                (widget.porcentaje - diferenciaAnimar) +
                    (diferenciaAnimar * controller.value),
                widget.colorPrimario,
                widget.colorSecundario,
                widget.grosorPrimario,
                widget.grosorSecundario,
                widget.gradient),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final colorPrimario;
  final colorSecundario;
  final grosorPrimario;
  final grosorSecundario;
  final gradient;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario,
      this.grosorPrimario, this.grosorSecundario, this.gradient);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;
    final center = new Offset(size.width * 0.5, size.height * 0.5);

    final radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    if (gradient == null)
      paintArco.color = colorPrimario;
    else {
      final rect = Rect.fromCircle(center: Offset(0, 0), radius: 180);
      paintArco.shader = gradient.createShader(rect);
    }

    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
