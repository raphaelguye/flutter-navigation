import 'package:flutter/material.dart';
import 'Views/FirstScreen.dart';
import 'IoCManager.dart';

void main() {

  IoCManager.setup();

  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstScreen(),
  ));
}