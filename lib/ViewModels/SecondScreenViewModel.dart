import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';
import 'ASecondScreenViewModel.dart';
import '../Services/ANavigationService.dart';

class SecondScreenViewModel implements ASecondScreenViewModel {
  ANavigationService navigationService;
  var name;
  RxCommand<BuildContext, void> submitCommand;
  RxCommand<String, bool> updateNameCommand;

  SecondScreenViewModel(ANavigationService navigationService) {
    this.navigationService = navigationService;

    updateNameCommand =
        RxCommand.createSync<String, bool>((s) => updateNameCommandExecute(s));

    submitCommand = RxCommand.createSync<BuildContext, void>(
        (context) => submitCommandExecute(context),
        canExecute: updateNameCommand);

    updateNameCommand.execute("");
  }

  void submitCommandExecute(BuildContext context) {
    print("Command executed");
    print('From ViewModel: Hello $name');
  }

  bool updateNameCommandExecute(String name) {
    this.name = name;
    return name.length > 4;
  }
}
