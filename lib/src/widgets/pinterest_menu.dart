import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.show = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: Builder(builder: (context) {
          Provider.of<_MenuModel>(context).backgroundColor =
              this.backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
          return AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: (show) ? 1 : 0,
            child: _PinterestMenuBackground(
              child: _MenuItems(items),
            ),
          );
        }));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final mModel = Provider.of<_MenuModel>(context);
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: mModel.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final mModel = Provider.of<_MenuModel>(context);
    final selectedItem = mModel.selectedItem;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (selectedItem == index) ? 30 : 25,
          color: (selectedItem == index)
              ? mModel.activeColor
              : mModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get selectedItem => this._selectedItem;

  set selectedItem(int index) {
    this._selectedItem = index;
    notifyListeners();
  }
}
