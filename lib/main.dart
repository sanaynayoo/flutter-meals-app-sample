import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';

final themeData = {};

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Tabs(),
    ),
  );
}
