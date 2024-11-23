import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  const QuestionWidget({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff669061),
              Color(0xff669061),
              Color(0xffC3AC55),
            ],
          ),
        ),
        child: FittedBox(
          child: Text(
            textAlign: TextAlign.right,
            question,
            style: const TextStyle(
              fontFamily: "Tajawal",
              color: Colors.white,
              fontSize: 1500,
            ),
          ),
        ),
      ),
    );
  }
}
