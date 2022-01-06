import 'package:flutter/material.dart';

const Color _defaultColor = Color(0xff67B821);
const Gradient _defaultGradient = RadialGradient(colors: <Color>[
  Color(0xff67B821),
  Color(0xff83C945),
]);

class FooterLogin extends StatelessWidget {
  final int style;
  final Color? color;
  final Gradient gradient;
  FooterLogin({this.style = 1, this.color, this.gradient = _defaultGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _FooterPainter(this.style, this.color, this.gradient),
      ),
    );
  }
}

class _FooterPainter extends CustomPainter {
  int stile;
  Color? color;
  Gradient gradient;
  _FooterPainter(this.stile, this.color, this.gradient);

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;
    if (color != null) {
      paint.color = color ?? _defaultColor;
    } else {
      final Rect rect = Rect.fromCircle(
          center: Offset(width * 0.5, height * 0.99), radius: 180);

      paint.shader = gradient.createShader(rect);
    }
    final path = Path();

    //Dibujar con el path y el paint
    if (stile == 2) {
      path.moveTo(0, height);
      path.lineTo(width * -0.015, height * 0.9107);
      path.cubicTo(width * 0.0134, height * 0.9077, width * 0.0551,
          height * 0.9117, width * 0.1008, height * 0.9133);
      path.cubicTo(width * 0.1565, height * 0.9153, width * 0.2160,
          height * 0.8978, width * 0.2776, height * 0.8973);
      path.cubicTo(width * 0.3830, height * 0.8991, width * 0.4996,
          height * 0.9074, width * 0.6139, height * 0.9246);
      path.cubicTo(width * 0.7449, height * 0.9401, width * 0.7791,
          height * 0.9174, width * 0.8491, height * 0.9095);
      path.quadraticBezierTo(
          width * 0.9930, height * 0.8910, width * 1.0465, height * 0.8901);
      path.lineTo(width, height);
    } else if (stile == 3) {
      path.moveTo(0, height);
      path.lineTo(width * -0.015, height * 0.9107);
      path.cubicTo(width * 0.0134, height * 0.9077, width * 0.0925,
          height * 0.9292, width * 0.1382, height * 0.9308);
      path.cubicTo(width * 0.1938, height * 0.9328, width * 0.2160,
          height * 0.8978, width * 0.2776, height * 0.8973);
      path.cubicTo(width * 0.3830, height * 0.8991, width * 0.3721,
          height * 0.9050, width * 0.5366, height * 0.9331);
      path.cubicTo(width * 0.5518, height * 0.9357, width * 0.5598,
          height * 0.9373, width * 0.5756, height * 0.9382);
      path.cubicTo(width * 0.6779, height * 0.9437, width * 0.7791,
          height * 0.9174, width * 0.8491, height * 0.9095);
      path.quadraticBezierTo(
          width * 0.9420, height * 0.8992, width * 1.0465, height * 0.8901);
      path.lineTo(width, height);
    } else {
      path.moveTo(0, height);
      path.lineTo(0, height * 0.8901);
      path.quadraticBezierTo(
          width * 0.1045, height * 0.8992, width * 0.1973, height * 0.9095);
      path.quadraticBezierTo(
          width * 0.3541, height * 0.9243, width * 0.4637, height * 0.9132);
      path.cubicTo(width * 0.6282, height * 0.8850, width * 0.6802,
          height * 0.8911, width * 0.7689, height * 0.8972);
      path.cubicTo(width * 0.8586, height * 0.9034, width * 0.9179,
          height * 0.9283, width, height * 0.9257);
      path.lineTo(width, height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
