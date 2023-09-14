import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Image.network(
          'https://source.unsplash.com/random?sig=$index',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
