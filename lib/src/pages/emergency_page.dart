import 'package:animate_do/animate_do.dart';
import 'package:custom_painters/src/widgets/boton_gordo.dart';
import 'package:custom_painters/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myList = _items;
    Size size = MediaQuery.of(context).size;
    bool isLarge = size.height > 400;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: isLarge ? size.height * 0.32 : 10),
              child: SafeArea(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        duration: Duration(milliseconds: 250),
                        child: BotonGordo(
                          text: myList[index].texto,
                          onPress: () {
                            print("Hola desde ${myList[index].texto} $index");
                          },
                          color1: myList[index].color1,
                          color2: myList[index].color2,
                          icon: myList[index].icon,
                        ),
                      );
                    }),
              )),
          if (isLarge) PageHeader(),
        ],
      ),
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      text: "Motor Accident",
      onPress: () {
        print("Hola");
      },
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
      icon: FontAwesomeIcons.carCrash,
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: "Asistencia Médica",
          subtitulo: "Haz solicitado",
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

final _items = <ItemBoton>[
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
];
