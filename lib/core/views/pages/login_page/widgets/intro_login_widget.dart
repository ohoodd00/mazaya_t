import 'package:flutter/material.dart';

class IntroLoginWidget extends StatelessWidget {
  const IntroLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.topRight,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "الرئيسية | تسجيل الدخول",
            style: TextStyle(fontFamily: "Tajawal", color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "تسجيل الدخول",
            style: TextStyle(
                fontFamily: "Tajawal",
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
