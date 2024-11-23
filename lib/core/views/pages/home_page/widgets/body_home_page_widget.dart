import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/home_page/widgets/intro_button.dart';
import 'package:mazaya/core/views/pages/home_page/widgets/intro_title_widget.dart';
import 'package:mazaya/core/views/pages/newest_offers_page/newest_offers_page.dart';
import 'package:mazaya/core/views/pages/offer_category_page/offer_kide_page.dart';

class BodyHomePageWidget extends StatelessWidget {
  const BodyHomePageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          const IntroTitleWidget(),
          const Spacer(),
          Column(
            children: [
              IntroButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OfferKidePage()));
                },
                text: "تصنيفات العروض",
              ),
              IntroButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewestOffersPage()));
                },
                text: "أحدث العــــروض",
              ),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
