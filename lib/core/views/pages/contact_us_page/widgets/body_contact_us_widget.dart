import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/contact_us_page/widgets/card_contact_us_widget.dart';
import 'package:mazaya/core/views/pages/contact_us_page/widgets/intro_contact_us_widget.dart';

class BodyContactUsWidget extends StatelessWidget {
  const BodyContactUsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntroContactUsWidget(),
          CardContactUsWidget(),
        ],
      ),
    );
  }
}
