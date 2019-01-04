import 'dart:async';
import 'ASecondScreenViewModel.dart';
import '../Services/ANavigationService.dart';

class SecondScreenViewModel implements ASecondScreenViewModel {
  ANavigationService navigationService;
  var name;
  var _nameTextController = StreamController<String>.broadcast();

  SecondScreenViewModel(ANavigationService navigationService) {
    this.navigationService = navigationService;
  }

  @override
  Sink get nameTextController => _nameTextController;

  @override
  Stream<bool> get isSubmitButtonEnabled =>
      _nameTextController.stream.map((name) => name.length > 3);

  @override
  void submitButtonExecute() {
    print('From ViewModel: Hello $name');
  }

  @override
  void dispose() => _nameTextController.close();
}
