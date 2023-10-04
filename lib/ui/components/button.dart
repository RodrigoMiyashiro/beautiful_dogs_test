import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;

  const Button({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      onPressed: onPressed,
      child: Container(
        height: 40,
        constraints: const BoxConstraints(
          maxWidth: 100,
        ),
        child: const Center(
          child: Text(
            'Gerar doguinho',
          ),
        ),
      ),
    );
  }
}
