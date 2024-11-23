import 'package:flutter/material.dart';

class ReadMoreButtonWidget extends StatelessWidget {
  const ReadMoreButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        " قراءه المزيد",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "Tajawal",
        ),
      ),
    );
  }
}
