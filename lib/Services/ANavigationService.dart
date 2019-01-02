
enum PageToken {
  FirstScreen, SecondScreen
}

abstract class ANavigationService {

  void navigate(PageToken pageToken);

}