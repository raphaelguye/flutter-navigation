import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';
import 'ASecondScreenViewModel.dart';
import '../Services/ANavigationService.dart';

class SecondScreenViewModel implements ASecondScreenViewModel {
  ANavigationService navigationService;
  var name;
  RxCommand<BuildContext, void> submitCommand;
  RxCommand<String, bool> updateNameCommand;
  BuildContext currentContext;

  SecondScreenViewModel(ANavigationService navigationService) {
    this.navigationService = navigationService;

    updateNameCommand =
        RxCommand.createSync<String, bool>((s) => updateNameCommandExecute(s));

    submitCommand = RxCommand.createSync<BuildContext, void>(
        (context) => submitCommandExecute(context),
        canExecute: updateNameCommand);

    updateNameCommand.execute("");
  }

  ASecondScreenViewModel of(BuildContext context) {
    currentContext = context;
    return this;
  }

  void submitCommandExecute(BuildContext context) {
    print('From ViewModel: Hello $name');

    //Apparently the context is always null so we have to use the currentContext. Don't understand why...
    var contextToBeUsed = context ?? currentContext;

    //TODO: Create a DialogService
    showDialog(
            context: contextToBeUsed,
            builder: (_) => new AlertDialog(
                  title: new Text('Hello'),
                  content: new Text('Hello ${name}'),
                ))
        .whenComplete(() => print('showDialog success'))
        .catchError(() => print('showDialog error'));
  }

  bool updateNameCommandExecute(String name) {
    this.name = name;
    return name.length > 4;
  }
}
