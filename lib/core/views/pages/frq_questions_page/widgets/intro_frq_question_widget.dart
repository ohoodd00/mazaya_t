import 'package:flutter/material.dart';

class IntroFrqQuestionWidget extends StatelessWidget {
  const IntroFrqQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "الرئيسية |الأسئلة الشائعة",
            style: TextStyle(fontFamily: "Tajawal", color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "الأسئلة الشائعة",
            style: TextStyle(
                fontFamily: "Tajawal",
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
