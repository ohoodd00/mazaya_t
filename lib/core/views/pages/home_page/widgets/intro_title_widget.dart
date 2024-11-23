import 'package:flutter/material.dart';

class IntroTitleWidget extends StatelessWidget {
  const IntroTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            child: Text(
              "تطبيق مزايا",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontFamily: "Tajawal",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text(
              "تقدم جامعة الطائف ممثلة بوحدة الشراكات الاستراتيجية "
              "والمبادرات تطبيق"
              " مزايا وهي منصة تعرض العديد من العروض والخصومات في "
              "مجالات متنوعة التي يمكن الاستفادة منها لمنسوبي"
              " الجامعة من (أعضاء هيئة تدريس. موظفين. طلبة). وكذلك "
              "الترحيب بالجهات الراغبة في تسويق منتجاتها"
              " لدى الجامعة بعد إكمال الإجراءات النظامية اللازمة.",
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontSize: 15,
                color: Colors.white,
                fontFamily: "Tajawal",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
