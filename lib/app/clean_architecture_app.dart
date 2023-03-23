import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/simple_mvvm/simple_screen.dart';

class CleanArchitectureApp extends StatefulWidget {
  @override
  _CleanArchitectureAppState createState() => _CleanArchitectureAppState();
}

class _CleanArchitectureAppState extends State<CleanArchitectureApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleScreen(),
    );
  }
}
