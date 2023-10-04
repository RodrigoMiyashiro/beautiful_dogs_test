import 'package:beatiful_dogs_test/ui/components/button.dart';
import 'package:beatiful_dogs_test/ui/components/dog_frame.dart';
import 'package:beatiful_dogs_test/ui/components/loading.dart';
import 'package:beatiful_dogs_test/ui/components/message_no_image.dart';
import 'package:beatiful_dogs_test/ui/components/text_have_frame.dart';
import 'package:beatiful_dogs_test/ui/presenter/dog_presenter.dart';
import 'package:beatiful_dogs_test/ui/presenter/dog_presenter_provider.dart';
import 'package:flutter/material.dart';

class DoguinhoPageV2 extends StatefulWidget {
  const DoguinhoPageV2({
    super.key,
  });

  @override
  State<DoguinhoPageV2> createState() => _DoguinhoPageV2State();
}

class _DoguinhoPageV2State extends State<DoguinhoPageV2> {
  final List<String> _imageURL = [];

  int _currentImageIndex = 0;
  bool _isLoading = false;

  late DogPresenterProvider _presenterProvider;

  @override
  void initState() {
    super.initState();
    _presenterProvider = DogPresenter();
  }

  @override
  void dispose() {
    _presenterProvider.dispose();
    super.dispose();
  }

  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos de doguinhos'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _imageURL.clear();
                _currentImageIndex = 0;
              });
            },
            icon: const Icon(
              Icons.cleaning_services_outlined,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _isLoading
                        ? const Loading()
                        : _imageURL.isNotEmpty
                            ? DogFrame(
                                imageURL: _imageURL[_currentImageIndex],
                              )
                            : const MessageNoImage(),
                  ),
                  Button(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            debugPrint('- - Vai chamar o obtain');
                            await _presenterProvider.obtainDog();
                          },
                  ),
                ],
              ),
            ),
            if (_imageURL.isNotEmpty) const TextHaveFrame(),
            if (_imageURL.isNotEmpty)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: _imageURL.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: index == _currentImageIndex
                                ? Colors.amber
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Image.network(
                          _imageURL[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
