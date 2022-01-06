import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  Slideshow(
      {required this.slides,
      this.dotsUp = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryBullet = 12,
      this.secondaryBullet = 12});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) {
          return new _SlideshowModel();
        },
        child: Center(
          child: Builder(builder: (context) {
            Provider.of<_SlideshowModel>(context)._primaryColor =
                this.primaryColor;
            Provider.of<_SlideshowModel>(context)._secondaryColor =
                this.secondaryColor;
            Provider.of<_SlideshowModel>(context)._primaryBullet =
                primaryBullet;
            Provider.of<_SlideshowModel>(context)._secondaryBullet =
                secondaryBullet;

            return _SlideshowStructure(dotsUp: dotsUp, slides: slides);
          }),
        ),
      ),
    );
  }
}

class _SlideshowStructure extends StatelessWidget {
  const _SlideshowStructure({
    Key? key,
    required this.dotsUp,
    required this.slides,
  }) : super(key: key);

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.dotsUp) _Dots(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!this.dotsUp) _Dots(this.slides.length),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      //print("Página actual: ${pageViewController.page}");
      //Actualizar provider
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page ?? -1;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    bool isActive = (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5);
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: isActive ? ssModel.primaryBullet : ssModel.secondaryBullet,
      height: isActive ? ssModel.primaryBullet : ssModel.secondaryBullet,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isActive ? ssModel.primaryColor : ssModel.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
  }

  double get primaryBullet => this._primaryBullet;
  set primaryBullet(double primaryBullet) {
    this._primaryBullet = primaryBullet;
  }

  double get secondaryBullet => this._secondaryBullet;
  set secondaryBullet(double secondaryBullet) {
    this._secondaryBullet = secondaryBullet;
  }
}
