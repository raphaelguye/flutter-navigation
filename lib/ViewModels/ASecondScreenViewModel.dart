
abstract class ASecondScreenViewModel {
  //TODO: Is it possible to deal only with the nameTextController??
  var name;
  Sink get nameTextController;
  
  Stream<bool> get isSubmitButtonEnabled;
  void submitButtonExecute();

  void dispose();
}