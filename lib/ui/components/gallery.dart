import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  final String imageURL;
  final Color color;
  final void Function()? onTap;

  const Gallery({
    super.key,
    required this.imageURL,
    required this.color,
    this.onTap,
  });

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Image.network(
          widget.imageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
