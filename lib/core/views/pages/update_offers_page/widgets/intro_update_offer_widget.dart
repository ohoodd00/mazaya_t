import 'package:flutter/material.dart';

class IntroUpdateOfferWidget extends StatelessWidget {
  const IntroUpdateOfferWidget({
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
            "الرئيسيه | تقدم عرض  ",
            style: TextStyle(fontFamily: "Tajawal", color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            " من فضلك قم بتعبأه البيانات التاليه",
            style: TextStyle(
                fontFamily: "Tajawal",
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            " تقدم العرض",
            style: TextStyle(
                fontFamily: "Tajawal",
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
