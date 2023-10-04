import 'package:flutter/material.dart';

class MessageNoImage extends StatelessWidget {
  const MessageNoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Nenhum doguinho :(',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
