import 'package:flutter/material.dart';

enum PageToken {
  FirstScreen, SecondScreen, ListViewScreen,
}

abstract class ANavigationService {

  void navigate(PageToken pageToken, BuildContext context);

}