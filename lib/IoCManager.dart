import 'package:get_it/get_it.dart';
import 'ViewModels/AFirstScreenViewModel.dart';
import 'ViewModels/FirstScreenViewModel.dart';

class IoCManager {

  static GetIt ioc = GetIt();

  static void setup() {
    ioc.registerSingleton<AFirstScreenViewModel>(new FirstScreenViewModel());
  }

}