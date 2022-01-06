import 'package:custom_painters/src/theme/theme.dart';
import 'package:custom_painters/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body: HeaderCurvoCustom(
        color: appTheme.accentColor,
      ),
    );
  }
}
