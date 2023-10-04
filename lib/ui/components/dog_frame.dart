import 'package:flutter/material.dart';

class DogFrame extends StatelessWidget {
  final String imageURL;

  const DogFrame({
    super.key,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageURL,
      height: 180,
      width: 180,
    );
  }
}
