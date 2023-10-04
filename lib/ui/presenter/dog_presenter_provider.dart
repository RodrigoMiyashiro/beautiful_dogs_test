abstract class DogPresenterProvider {
  Stream<String> get outController;
  Future<void> obtainDog();
  void dispose();
}
