import 'package:flutter/material.dart';
import 'ANavigationService.dart';
import '../Views/FirstScreen.dart';
import '../Views/SecondScreen.dart';

class NavigationService implements ANavigationService {

  Navigator navigator;

  NavigationService(Navigator navigator) {
    this.navigator = navigator;
  }

  void navigate(PageToken pageToken) {
    switch(pageToken) {
      case PageToken.FirstScreen:
      break;
      case PageToken.SecondScreen:
      break;
    }
  }

}