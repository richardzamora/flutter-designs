import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function() onPress;

  const BotonGordo(
      {Key? key,
      this.icon = FontAwesomeIcons.empire,
      required this.text,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BotonGordoBackground(color1, color2, icon),
        GestureDetector(
            onTap: onPress,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 140, width: 40),
                  FaIcon(icon, color: Colors.white, size: 40),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      this.text,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
                  SizedBox(
                    width: 40,
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;

  const _BotonGordoBackground(this.color1, this.color2, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          color1,
          color2,
        ]),
      ),
    );
  }
}
