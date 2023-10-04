import 'dart:async';

import 'package:beatiful_dogs_test/ui/interactor/dog_interactor_provider.dart';
import 'package:beatiful_dogs_test/ui/presenter/dog_presenter_listener.dart';
import 'package:beatiful_dogs_test/ui/presenter/dog_presenter_provider.dart';
import 'package:flutter/cupertino.dart';

class DogPresenter extends ChangeNotifier
    implements DogPresenterProvider, DogPresenterListener {
  final StreamController<String> _controller = StreamController<String>();

  @override
  Stream<String> get outController => _controller.stream;

  late DogInteractorProvider _interactor;

  @override
  Future<void> obtainDog() async {
    _interactor.obtainDog();
  }

  @override
  void receiverDog(String imageURL) {
    _controller.sink.add(imageURL);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
