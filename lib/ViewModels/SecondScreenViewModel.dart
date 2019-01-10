import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';
import 'dart:async';
import 'ASecondScreenViewModel.dart';
import '../Services/ANavigationService.dart';

class SecondScreenViewModel implements ASecondScreenViewModel {
  ANavigationService navigationService;
  var name;
  RxCommand<BuildContext, void> submitCommand;
  RxCommand<String, bool> updateNameCommand;
  Stream<String> get resultStream => resultStreamController.stream;
  BuildContext currentContext;
  StreamController<String> resultStreamController;

  SecondScreenViewModel(ANavigationService navigationService) {
    this.navigationService = navigationService;

    resultStreamController = StreamController<String>();

    updateNameCommand =
        RxCommand.createSync<String, bool>((s) => updateNameCommandExecute(s));

    submitCommand = RxCommand.createSync<BuildContext, void>(
        (context) => submitCommandExecute(context),
        canExecute: updateNameCommand);

    updateNameCommand.execute('');
  }

  @override
  ASecondScreenViewModel of(BuildContext context) {
    currentContext = context;
    return this;
  }

  @override
  void dispose() {
    resultStreamController.close();
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
                  content: new Text('Hello $name'),
                ))
        .whenComplete(() => print('showDialog success'))
        .catchError(() => print('showDialog error'));
  }

  bool updateNameCommandExecute(String name) {
    this.name = name;

    if (name.length > 4) {
      resultStreamController.add('');
      return true;
    } else {
      if (name == null || name.length == 0) {
        resultStreamController.add('');
      } else {
        resultStreamController.add('the name is too short (${name.length})');
      }
      return false;
    }
  }
}
