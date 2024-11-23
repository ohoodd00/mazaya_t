import 'package:flutter/material.dart';

class CustomIntroWidget extends StatelessWidget {
  final String? offerList;
  const CustomIntroWidget({
    super.key,
    this.offerList,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.topRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.right,
              "الرئيسيه | تصنيفات العروض | $offerList ",
              style:
                  const TextStyle(fontFamily: "Tajawal", color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              " $offerList",
              style: const TextStyle(
                  fontFamily: "Tajawal",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
