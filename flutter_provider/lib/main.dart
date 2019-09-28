import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/common/theme.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/catalog.dart';
import 'package:flutter_provider/screens/cart.dart';
import 'package:flutter_provider/screens/catalog.dart';
import 'package:flutter_provider/screens/focus_image.dart';
import 'package:flutter_provider/screens/positiontransition_demo.dart';
import 'package:flutter_provider/screens/expand_card.dart';
import 'package:flutter_provider/screens/carsousel.dart';
import 'package:flutter_provider/screens/squence_animation.dart';
import 'package:flutter_provider/screens/swipe_card.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        home: CardSwipeDemo(),        
      );
  }
}