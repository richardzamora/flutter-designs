import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _color = Color(0xff615AAB);

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: _color,
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(45),
          ),
          color: _color),
    );
  }
}

class HeaderCorteDiagonal extends StatelessWidget {
  const HeaderCorteDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = _color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar con el path y el paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderCorteTriangular extends StatelessWidget {
  const HeaderCorteTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = _color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderCorteCarta extends StatelessWidget {
  const HeaderCorteCarta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCartaPainter(),
      ),
    );
  }
}

class _HeaderCartaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = _color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.22);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.22);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderCurvoCustom extends StatelessWidget {
  final Color color;

  const HeaderCurvoCustom({this.color = _color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoCustomPainter(this.color),
      ),
    );
  }
}

class _HeaderCurvoCustomPainter extends CustomPainter {
  final Color color;
  _HeaderCurvoCustomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.22);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.1,
        size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.9, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = _color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.22);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.22);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: Offset(150, size.height * 0.9), radius: 180);

    final Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Colors.blue,
          Colors.purple,
          Colors.deepPurple,
        ]);
    final paint = Paint()..shader = gradient.createShader(rect);

    //Propiedades
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar con el path y el paint
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.80,
        size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.70, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class IconHeader extends StatelessWidget {
  final Color colorBlanco = Colors.white.withOpacity(0.7);

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  IconHeader({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _IconHeaderBackground(this.color1, this.color2),
        Positioned(
            top: -50,
            left: -60,
            child: FaIcon(
              icon,
              size: 200,
              color: Colors.white.withOpacity(0.2),
            )),
        Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
            ),
            Text(
              this.subtitulo,
              style: TextStyle(fontSize: 20, color: colorBlanco),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.titulo,
              style: TextStyle(
                  fontSize: 25,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(icon, size: 60, color: Colors.white),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  _IconHeaderBackground(this.color1, this.color2);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              this.color1,
              this.color2,
            ]),
      ),
    );
  }
}
