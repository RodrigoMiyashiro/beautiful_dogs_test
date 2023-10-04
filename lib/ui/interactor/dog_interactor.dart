import 'package:beatiful_dogs_test/ui/interactor/dog_interactor_provider.dart';
import 'package:beatiful_dogs_test/ui/interactor/dog_interactor_receiver.dart';
import 'package:beatiful_dogs_test/ui/presenter/dog_presenter_listener.dart';
import 'package:beatiful_dogs_test/ui/repository/dog_repository.dart';
import 'package:flutter/material.dart';

class DogInteractor implements DogInteractorProvider, DogInteractorReceiver {
  late DogRepository _repository;
  late DogPresenterListener _listener;

  DogInteractor(DogPresenterListener listener) {
    _listener = listener;
  }

  @override
  Future<void> obtainDog() async {
    debugPrint('- - obtainDog_Interactor');

    _repository.obtainDog();
  }

  @override
  void receiverDog(String imageURL) {
    _listener.receiverDog(imageURL);
  }

  @override
  void receiverDogError(String error) {}
}
