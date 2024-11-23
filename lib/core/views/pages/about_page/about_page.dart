import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/home_page/widgets/intro_button.dart';

class AboutPage extends StatelessWidget {
  static String id = "AboutPage";
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/image/about.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "حول تطبيق مزايا",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Tajawal"),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: const Text(
                        "منصة مزايا\n",
                        // "تقدم جامعة الطائف ممثلة بوحدة الشراكات"
                        // "الاستراتيجية و المبادرات منصة مزايا و هي منصة "
                        // // " مجالات متنوعة التي يمكن الاستفادة منها لمنسوبي7"
                        // " تعرض العديد من العروض و الخصومات في مجالات "
                        // " متنوعة التي يمكن الاستفادة منها لمنسوبي الجامعة من (أعضاء هيئة تدريس , موظفين , طلبة) "
                        // "وكذلك الترحيب بالجهات الراغبة في تسويق منتجاتها لدئ الجامعة بعد اكمال الاجراءات النظامية اللازمة",
                        maxLines: 20,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Tajawal"),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: const Text(
                        // "منصة مزايا\n"
                        " تقدم جامعة الطائف ممثلة بوحدة الشراكات"
                        " الاستراتيجية و المبادرات منصة مزايا و هي منصة "
                        // " مجالات متنوعة التي يمكن الاستفادة منها لمنسوبي7"
                        " تعرض العديد من العروض و الخصومات في مجالات "
                        " متنوعة التي يمكن الاستفادة منها لمنسوبي الجامعة من (أعضاء هيئة تدريس , موظفين , طلبة) "
                        "وكذلك الترحيب بالجهات الراغبة في تسويق منتجاتها لدى الجامعة بعد اكمال الاجراءات النظامية اللازمة",
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Tajawal"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IntroButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: "رجوع")
          ],
        ),
      ),
    ));
  }
}
