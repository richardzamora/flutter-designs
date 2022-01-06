import 'package:flutter/material.dart';

const Color _defaultColor = Color(0xff83C945);

class HorizontalTicketCard extends StatelessWidget {
  Color color;
  HorizontalTicketCard({this.color = _defaultColor});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _TicketCardPainter(color),
        ));
  }
}

class _TicketCardPainter extends CustomPainter {
  Color color;

  _TicketCardPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.08310249, 0);
    path_0.lineTo(size.width * 0.9196676, 0);
    path_0.lineTo(size.width * 0.9196676, size.height);
    path_0.lineTo(size.width * 0.9335180, size.height);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.9677419);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.9677419);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.9139785);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.9139785);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.8602151);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.8602151);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.8064516);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.8064516);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.7526882);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.7526882);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.6989247);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.6989247);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.6451613);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.6451613);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.5913978);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.5913978);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.5376344);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.5376344);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.4838710);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.4838710);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.4301075);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.4301075);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.4838710);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.3763441);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.3763441);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.3225806);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.3225806);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.2688172);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.2688172);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.2150538);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.2150538);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.1612903);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.1612903);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.1075269);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.1075269);
    path_0.lineTo(size.width * 0.9196676, size.height * 0.05376344);
    path_0.lineTo(size.width * 0.9335180, size.height * 0.05376344);
    path_0.lineTo(size.width * 0.9335180, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.2500000);
    path_0.lineTo(size.width, size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.9415125,
        size.height * 0.3398667,
        size.width * 0.9411828,
        size.height * 0.6634333,
        size.width,
        size.height * 0.7500000);
    path_0.lineTo(size.width, size.height * 0.7500000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.08033241, size.height);
    path_0.lineTo(size.width * 0.08033241, 0);
    path_0.lineTo(size.width * 0.06648199, 0);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.03225806);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.03225806);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.08602151);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.08602151);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.1397849);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.1397849);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.1935484);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.1935484);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.2473118);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.2473118);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.3010753);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.3010753);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.3548387);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.3548387);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.4086022);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.4086022);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.4623656);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.4623656);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.5161290);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.5161290);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.5698925);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.5698925);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.6236559);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.6236559);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.6774194);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.6774194);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.7311828);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.7311828);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.7849462);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.7849462);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.8387097);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.8387097);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.8924731);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.8924731);
    path_0.lineTo(size.width * 0.08033241, size.height * 0.9462366);
    path_0.lineTo(size.width * 0.06648199, size.height * 0.9462366);
    path_0.lineTo(size.width * 0.06648199, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.7500000);
    path_0.lineTo(0, size.height * 0.7500000);
    path_0.cubicTo(
        size.width * 0.05881634,
        size.height * 0.6634333,
        size.width * 0.05848698,
        size.height * 0.3398667,
        0,
        size.height * 0.2500000);
    path_0.lineTo(0, size.height * 0.2500000);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width * 0.06648199, 0);
    path_0.lineTo(size.width * 0.08310249, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
