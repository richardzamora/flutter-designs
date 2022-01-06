import 'package:custom_painters/src/models/layout_model.dart';
import 'package:custom_painters/src/pages/launcher_page.dart';
import 'package:custom_painters/src/pages/launcher_tablet_page.dart';
import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() => runApp(
      // ChangeNotifierProvider(
      //   create: (_) => new ThemeChanger(2),
      //   child: MyApp(),
      // ),
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => new ThemeChanger(3)),
          ChangeNotifierProvider(create: (_) => new LayoutModel()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (context, orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else
            return LauncherPage();
        },
      ),
    );
  }
}
