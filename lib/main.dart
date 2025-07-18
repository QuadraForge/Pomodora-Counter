import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(FocusMateApp());
}

class FocusMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocusMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
