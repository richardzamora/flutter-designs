import 'package:custom_painters/src/theme/theme.dart';
import 'package:custom_painters/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.orange),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
              porcentaje: porcentaje,
              gradient: RadialGradient(colors: <Color>[
                Colors.amber,
                Colors.pink,
              ]),
            ),
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple),
          ],
        ),
      ]),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final gradient;
  final double porcentaje;

  const CustomRadialProgress(
      {Key? key,
      required this.porcentaje,
      this.color = Colors.pink,
      this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final textTheme =
        appTheme.textTheme.bodyText1 ?? TextStyle(color: Colors.grey);
    return Container(
      width: 170,
      height: 170,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: textTheme.color ?? Colors.grey,
        gradient: gradient,
      ),
    );
  }
}
