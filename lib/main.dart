import 'package:flutter/material.dart';
import 'package:movies_app/features/layout/layout_screen.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LayoutScreen());
  }
}
