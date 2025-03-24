import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        image: AssetImage(
          imageUrl,
        ),
      ),
    );
  }
}
