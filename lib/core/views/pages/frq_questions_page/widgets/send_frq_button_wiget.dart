

import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/contact_us_page/contact_us_page.dart';

class SendFrqButton extends StatelessWidget {
  const SendFrqButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ContactUsPage()));
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.45,
        height: MediaQuery.sizeOf(context).height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff669061),
                  Color(0xff669061),
                  Color(0xffC3AC55),
                ])),
        child: const Text(
          "راسلنا",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "Tajawal",
          ),
        ),
      ),
    );
  }
}
