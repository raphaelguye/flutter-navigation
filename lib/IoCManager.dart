import 'package:get_it/get_it.dart';
import 'Services/ANavigationService.dart';
import 'Services/NavigationService.dart';
import 'ViewModels/AFirstScreenViewModel.dart';
import 'ViewModels/FirstScreenViewModel.dart';
import 'ViewModels/ASecondScreenViewModel.dart';
import 'ViewModels/SecondScreenViewModel.dart';
import 'ViewModels/AListViewScreenViewModel.dart';
import 'ViewModels/ListViewScreenViewModel.dart';

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
    ioc.registerSingleton<AFirstScreenViewModel>(
        new FirstScreenViewModel(navigationService));
    ioc.registerSingleton<ASecondScreenViewModel>(
        new SecondScreenViewModel(navigationService));
    ioc.registerSingleton<AListViewScreenViewModel>(
        new ListViewScreenViewModel(navigationService));
  }
}
