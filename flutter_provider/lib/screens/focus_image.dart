import 'package:flutter/material.dart';

class FocusImageDemo extends StatelessWidget {
  static String routeName = '/misc/focus_image';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Focus Image')),
      body: Grid(),
    );
  }
}

class Grid extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 40,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return (index >= 20)
              ? SmallCard('assets/eat_cape_town.png')
              : SmallCard('assets/eat_new_orleans_sm.jpg');
        },
      ),
    );
  }
}

Route _createRoute(BuildContext parentContext, String image) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return _SecondPage(image);
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var rectAnimation = _createTween(parentContext)
          .chain(CurveTween(curve: Curves.ease))
          .animate(animation);

      return Stack(
        children: [
          PositionedTransition(rect: rectAnimation, child: child),
        ],
      );
    },
  );
}

Tween<RelativeRect> _createTween(BuildContext context) {
  var windowSize = MediaQuery.of(context).size;
  var box = context.findRenderObject() as RenderBox;
  var offset = box.localToGlobal(Offset.zero);
  var rect =  offset & box.size;
  ///获取当前box的offset然后和其box.size 运用操作符‘&’，得到一个react实例，
  /// 例如 (0,0,100,100) 就是调用了Rect.fromLTWH(dx, dy, width, height) 方法
  var relativeRect = RelativeRect.fromSize(rect, windowSize);
  /// 创建一个更友好的展开效果，看起来是在当前box逐渐放大
  return RelativeRectTween(
    begin: relativeRect,
    end: RelativeRect.fill,
  );
}

class SmallCard extends StatelessWidget {
  final String imageAssetName;

  SmallCard(this.imageAssetName);

  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            var nav = Navigator.of(context);
            nav.push(_createRoute(context, imageAssetName));
          },
          child: Image.asset(
            imageAssetName,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  final String imageAssetName;

  _SecondPage(this.imageAssetName);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                imageAssetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}