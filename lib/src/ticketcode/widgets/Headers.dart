import 'package:flutter/material.dart';

const Color _defaultColor = Color(0xff67B821);
const Gradient _defaultGradient = RadialGradient(colors: <Color>[
  Color(0xff67B821),
  Color(0xff83C945),
]);

class HeaderLogin extends StatelessWidget {
  final int style;
  final Color? color;
  final Gradient gradient;
  HeaderLogin({this.style = 1, this.color, this.gradient = _defaultGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPainter(this.style, this.color, this.gradient),
      ),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  int style;
  Color? color;
  Gradient gradient;
  _HeaderPainter(this.style, this.color, this.gradient);

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
          center: Offset(width * 0.5, height * 0.1), radius: 180);

      paint.shader = gradient.createShader(rect);
    }
    final path = Path();

    //Dibujar con el path y el paint
    if (style == 2) {
      path.lineTo(0, height * 0.1658);
      path.quadraticBezierTo(
          width * 0.0542, height * 0.1638, width * 0.2215, height * 0.1859);
      path.quadraticBezierTo(
          width * 0.3622, height * 0.1983, width * 0.5267, height * 0.1696);
      path.quadraticBezierTo(
          width * 0.6363, height * 0.1480, width * 0.7931, height * 0.1733);
      path.quadraticBezierTo(
          width * 0.8860, height * 0.1839, width, height * 0.1481);
      path.lineTo(width, 0);
    } else if (style == 3) {
      path.lineTo(0, height * 0.2155);
      path.quadraticBezierTo(
          width * 0.1113, height * 0.2451, width * 0.1949, height * 0.2524);
      path.quadraticBezierTo(
          width * 0.3355, height * 0.2678, width * 0.5, height * 0.2322);
      path.quadraticBezierTo(
          width * 0.6096, height * 0.2053, width * 0.7665, height * 0.2368);
      path.quadraticBezierTo(
          width * 0.9, height * 0.26, width, height * 0.2635);
      path.lineTo(width, 0);
    } else {
      path.lineTo(0, height * 0.215);
      path.quadraticBezierTo(
          width * 0.1, height * 0.20, width * 0.2, height * 0.185);
      path.quadraticBezierTo(
          width * 0.35, height * 0.1659, width * 0.46, height * 0.188);
      path.quadraticBezierTo(
          width * 0.628, height * 0.2268, width * 0.769, height * 0.2032);
      path.quadraticBezierTo(
          width * 0.9179, height * 0.1722, width * 0.973, height * 0.1743);
      path.lineTo(width, height * 0.1749);
      path.lineTo(width, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
