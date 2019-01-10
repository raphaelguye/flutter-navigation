import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';

abstract class ASecondScreenViewModel {
  ASecondScreenViewModel of(BuildContext context);
  void dispose();

  var name;

  RxCommand<BuildContext, void> submitCommand;
  RxCommand<String, bool> updateNameCommand;
  Stream<String> get resultStream;
}
