import 'package:custom_painters/src/theme/theme.dart';
import 'package:custom_painters/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 500;

    final children = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow()),
    ];

    return Scaffold(
        body: isLarge
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Slideshow(
      // primaryColor: Color(0xffFF5A7E),
      primaryColor: appTheme.darkTheme
          ? appTheme.currentTheme.accentColor
          : Color(0xffFF5A7E),
      primaryBullet: 18,
      slides: [
        SvgPicture.asset("assets/svgs/slide-1.svg"),
        SvgPicture.asset("assets/svgs/slide-2.svg"),
        SvgPicture.asset("assets/svgs/slide-3.svg"),
        SvgPicture.asset("assets/svgs/slide-4.svg"),
        SvgPicture.asset("assets/svgs/slide-5.svg"),
      ],
    );
  }
}
