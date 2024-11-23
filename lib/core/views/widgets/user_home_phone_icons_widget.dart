import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/contact_us_page/contact_us_page.dart';
import 'package:mazaya/core/views/pages/home_page/home_page.dart';
import 'package:mazaya/core/views/pages/login_page/login_page.dart';
import 'package:mazaya/core/views/widgets/icon_button_widget.dart';

class UserHomePhoneIconsWidgets extends StatelessWidget {
  final String idPage;
  const UserHomePhoneIconsWidgets({
    super.key,
    required this.idPage,
  });
  static bool checkLoginPage = true;
  static bool checkContactUsPage = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            idPage == LoginPage.id
                ? const SizedBox()
                : Navigator.pushNamed(context, LoginPage.id);
          },
          child: const HomIconWidget(
            image: "assets/image/user_image.png",
          ),
        ),
        GestureDetector(
          onTap: () {
            idPage == HomePage.id
                ? const SizedBox()
                : Navigator.pushNamed(context, HomePage.id);
          },
          child: const HomIconWidget(
            image: "assets/image/home_image.png",
          ),
        ),
        GestureDetector(
          onTap: () {
            idPage == ContactUsPage.id
                ? const SizedBox()
                : Navigator.pushNamed(context, ContactUsPage.id);
          },
          child: const HomIconWidget(
            image: "assets/image/phone_image.png",
          ),
        ),
      ],
    );
  }
}
