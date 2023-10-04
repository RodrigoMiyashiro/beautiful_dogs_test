import 'dart:convert';

import 'package:beatiful_dogs_test/ui/interactor/dog_interactor_receiver.dart';
import 'package:beatiful_dogs_test/ui/repository/dog_repository_executor.dart';
import 'package:http/http.dart' as http;

class DogRepository implements DogRepositoryExecutor {
  // final DogInteractorReceiver _receiver = DogInteractorReceiver();

  final DogInteractorReceiver _receiver;

  DogRepository(this._receiver);

  @override
  Future<void> obtainDog() async {
    try {
      final response =
          await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final imageUrl = data['message'] as String;
        _receiver.receiverDog(imageUrl);
      }
      return;
    } on Exception catch (exception) {
      _receiver.receiverDogError('Error: $exception');
    }
  }
}
