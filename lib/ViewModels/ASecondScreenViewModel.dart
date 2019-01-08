import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';

abstract class ASecondScreenViewModel {
  var name;
  RxCommand<BuildContext, void> submitCommand;
  RxCommand<String, bool> updateNameCommand;
}
