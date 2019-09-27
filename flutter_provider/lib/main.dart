import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/common/theme.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/catalog.dart';
import 'package:flutter_provider/screens/cart.dart';
import 'package:flutter_provider/screens/catalog.dart';
import 'package:flutter_provider/screens/focus_image.dart';

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
        home: FocusImageDemo(),        
      );
  }
}