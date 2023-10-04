import 'package:flutter/material.dart';

class TextHaveFrame extends StatelessWidget {
  const TextHaveFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Galeria',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
