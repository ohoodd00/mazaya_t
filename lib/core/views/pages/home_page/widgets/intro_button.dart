import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const IntroButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Tajawal"),
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.05,
                  child: Image.asset(
                      fit: BoxFit.fill,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      "assets/image/arrawleft.png"))
            ],
          ),
        ),
      ),
    );
  }
}
