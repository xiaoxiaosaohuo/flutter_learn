import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/common/theme.dart';

import 'package:flutter_provider/screens/repeatingAnimationDemo.dart';
import 'package:flutter_provider/screens/focus_image.dart';
import 'package:flutter_provider/screens/positiontransition_demo.dart';
import 'package:flutter_provider/screens/expand_card.dart';
import 'package:flutter_provider/screens/carsousel.dart';
import 'package:flutter_provider/screens/squence_animation.dart';
import 'package:flutter_provider/screens/swipe_card.dart';
import 'package:flutter_provider/screens/provider_demo.dart';
import 'package:flutter_provider/screens/inherited_counter.dart';



void main() {
  runApp(MyApp());
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;
  
  const Demo({this.name,this.route,this.builder});
}

final animateDemos = [
  Demo(
      name: 'CarouselDemo',
      route: CarouselDemo.routeName,
      builder: (context) => CarouselDemo()
  ),
  Demo(
      name: 'ExpandCardDemo',
      route: ExpandCardDemo.routeName,
      builder: (context) => ExpandCardDemo()
  ),
  Demo(
      name: 'CardSwipeDemo',
      route: CardSwipeDemo.routeName,
      builder: (context) => CardSwipeDemo()
  ),
  Demo(
      name: 'PTDemo',
      route: PTDemo.routeName,
      builder: (context) => PTDemo()
  ),
  Demo(
      name: 'FocusImageDemo',
      route: FocusImageDemo.routeName,
      builder: (context) => FocusImageDemo()
  ),
  Demo(
      name: 'PhysicsCardDragDemo',
      route: PhysicsCardDragDemo.routeName,
      builder: (context) => PhysicsCardDragDemo()
  ),
  
  Demo(
      name: 'TweenSequenceDemo',
      route: TweenSequenceDemo.routeName,
      builder: (context) => TweenSequenceDemo()
  ),
];

final providerDemos = [
  Demo(
        name: 'InheritedCounter',
        route: InheritedCounter.routeName,
        builder: (context) => InheritedCounter()
  ),
  Demo(
        name: 'ProviderDemo',
        route: ProviderDemo.routeName,
        builder: (context) => ProviderDemo()
  ),
  
];

final annimateDemoRoutes =
    Map.fromEntries(animateDemos.map((d) => MapEntry(d.route, d.builder)));

final providerDemoRoutes =
    Map.fromEntries(providerDemos.map((d) => MapEntry(d.route, d.builder)));


final allRoutes = <String, WidgetBuilder>{
  ...annimateDemoRoutes,
  ...providerDemoRoutes,
};
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    print( MapEntry('d.route', 'd.builder'));
    return MaterialApp(
      title: 'Demos',
      theme: appTheme,
      routes: allRoutes,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Samples'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Basics', style: headerStyle)),
          ...animateDemos.map((d) => DemoTile(d)),
          ListTile(title: Text('Misc', style: headerStyle)),
          ...providerDemos.map((d) => DemoTile(d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}