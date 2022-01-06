import 'package:custom_painters/src/theme/theme.dart';
import 'package:custom_painters/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        /* body: Center(
          /* child: PinterestGrid(), */
          child: PinterestMenu(),
        ), */
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print("Icon pie_chart");
        },
        icon: Icons.pie_chart),
    PinterestButton(
        onPressed: () {
          print("Icon search");
        },
        icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print("Icon notifications");
        },
        icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print("supervised_user_circle");
        },
        icon: Icons.supervised_user_circle)
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool showMenu = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    double widthPantalla = size.width;
    if (widthPantalla > 500) widthPantalla = widthPantalla - 250;
    return Positioned(
      bottom: 30,
      child: Container(
          width: widthPantalla,
          child: Center(
            child: PinterestMenu(
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              items: items,
              show: showMenu,
            ),
          )),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final controller = new ScrollController();

  final List<int> items = List.generate(200, (i) => i);
  double lastOffset = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset > lastOffset && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      lastOffset = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    int divider;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
      divider = 1;
    } else if (MediaQuery.of(context).size.width > 750) {
      count = 4;
      divider = 1;
    } else {
      count = 2;
      divider = 1;
    }
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(divider, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.blue,
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
