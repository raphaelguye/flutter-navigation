import 'package:flutter/material.dart';
import 'AFirstScreenViewModel.dart';
import '../Services/ANavigationService.dart';

class FirstScreenViewModel implements AFirstScreenViewModel {

  ANavigationService navigationService;

  FirstScreenViewModel(ANavigationService navigationService) {
    this.navigationService = navigationService;
  }

  @override 
  void buttonClicked(BuildContext context) {
    print('button clicked in view model');

    navigationService.navigate(PageToken.SecondScreen, context);
  }
}