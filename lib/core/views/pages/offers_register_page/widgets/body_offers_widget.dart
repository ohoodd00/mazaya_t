import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/offers_register_page/widgets/card_offers_widget.dart';
import 'package:mazaya/core/views/pages/offers_register_page/widgets/intro_offers_widget.dart';

class BodyOffersWidget extends StatelessWidget {
  final bool? txt;
  final int? index;
  final BuildContext? ctx;
  const BodyOffersWidget({
    super.key, required this.txt, required this.index,  this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const IntroOffersWidget(),
          CardOffersWidget(
            ctx: ctx,
            index: index,
            tex: txt,),
        ],
      ),
    );
  }
}
