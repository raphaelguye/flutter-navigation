import 'package:get_it/get_it.dart';
import 'ViewModels/AFirstScreenViewModel.dart';
import 'ViewModels/FirstScreenViewModel.dart';
import 'Services/ANavigationService.dart';
import 'Services/NavigationService.dart';

class IoCManager {

  static GetIt ioc = GetIt();

  static void setup() {

    registerServices();
    
    ANavigationService navigationService = ioc.get<ANavigationService>();

    registerViewModels(navigationService);
    
  }

  static void registerServices() {
    ioc.registerSingleton<ANavigationService>(new NavigationService());
  }

  static void registerViewModels(ANavigationService navigationService) {
    ioc.registerSingleton<AFirstScreenViewModel>(new FirstScreenViewModel(navigationService));
  }

}