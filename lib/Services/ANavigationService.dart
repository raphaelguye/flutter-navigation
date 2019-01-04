import 'package:flutter/material.dart';

enum PageToken {
  FirstScreen, SecondScreen
}

abstract class ANavigationService {

  void navigate(PageToken pageToken, BuildContext context);

}