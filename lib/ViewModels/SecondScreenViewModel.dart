import 'ASecondScreenViewModel.dart';
import '../Services/ANavigationService.dart';

class SecondScreenViewModel implements ASecondScreenViewModel {

  ANavigationService navigationService;
  var name;

  SecondScreenViewModel(ANavigationService navigationService) {
    this.navigationService = navigationService;
  }

  sayHello() {
    print('Hello $name');
  }  
  
}