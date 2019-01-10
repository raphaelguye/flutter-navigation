import 'package:flutter/material.dart';
import 'AListViewScreenViewModel.dart';
import '../Services/ANavigationService.dart';

class ListViewScreenViewModel implements AListViewScreenViewModel {
  ANavigationService navigationService;

  ListViewScreenViewModel(ANavigationService navigationService) {
    this.navigationService = navigationService;
  }
}
