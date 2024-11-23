import 'package:flutter/material.dart';

class HomIconWidget extends StatelessWidget {
  final String image;
  const HomIconWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Image.asset(
        width: 50,
        height: 50,
        fit: BoxFit.fill,
        image,
      ),
    );
  }
}
