import 'package:flutter/material.dart';

class IntroContactUsWidget extends StatelessWidget {
  const IntroContactUsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
          const Text(
            "الرئيسية | توصل معانا ",
            style: TextStyle(fontFamily: "Tajawal", color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "اتصل بنا",
            style: TextStyle(
                fontFamily: "Tajawal",
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "نسعد بالاجابة علئ استفساراتكم",
            style: TextStyle(fontFamily: "Tajawal", color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "البريد الالكتروني",
            style: TextStyle(
                fontFamily: "Tajawal",
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "mazaya@tu.edu.sa.com",
            style: TextStyle(fontFamily: "Tajawal", color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            " توصل معانا",
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
