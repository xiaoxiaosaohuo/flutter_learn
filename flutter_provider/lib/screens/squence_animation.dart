import 'package:flutter/material.dart';

class TweenSequenceDemo extends StatefulWidget {
  static const String routeName = '/animate/chaining_tweens';

  @override
  _TweenSequenceDemoState createState() => _TweenSequenceDemoState();
}

class _TweenSequenceDemoState extends State<TweenSequenceDemo>
    with SingleTickerProviderStateMixin {
  static const Duration duration = Duration(seconds: 3);
  AnimationController controller;
  Animation<Color> animation;

  static final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  void initState() {
    super.initState();

    final sequenceItems = <TweenSequenceItem<Color>>[];

    for (var i = 0; i < colors.length; i++) {
      final beginColor = colors[i];
      final endColor = colors[(i + 1) % colors.length];
      final weight = 1 / colors.length;

      sequenceItems.add(
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: beginColor, end: endColor),
          weight: weight,
        ),
      );
    }

    controller = AnimationController(duration: duration, vsync: this);
    animation = TweenSequence<Color>(sequenceItems).animate(controller);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return MaterialButton(
              color: animation.value,
              onPressed: () async {
                await controller.forward();
                controller.reset();
              },
              child: child,
            );
          },
          child: Text('Animate', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}