import 'package:flutter/material.dart';
import 'package:mazaya/core/views/widgets/app_bar_widget.dart';
import 'package:mazaya/core/views/widgets/buttons_nav_widget.dart';

class MainBackgroundWidget extends StatelessWidget {
  final Widget widget;
  final bool checkContactUsPage;
  final String image;
  final double hieghtImage;
  final String idPage;
  final bool? checkMenuPage;
  const MainBackgroundWidget({
    super.key,
    required this.widget,
    required this.checkContactUsPage,
    required this.image,
    required this.hieghtImage,
    required this.idPage,
    this.checkMenuPage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(height: hieghtImage, fit: BoxFit.cover, image),
                checkContactUsPage == false
                    ? SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: Center(child: widget),
                      )
                    : widget,
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    child: AppbarWidget(
                      checkMenuPage: checkMenuPage,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonNavWidget(
              idPage: idPage,
            ),
          ],
        ),
      ),
    );
  }
}
