import 'package:flutter/material.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/views/pages/update_offers_page/widgets/card_update_offer_widget.dart';
import 'package:mazaya/core/views/pages/update_offers_page/widgets/intro_update_offer_widget.dart';

class BodyUpdateOfferWidget extends StatelessWidget {
  final bool? txt;
  final int? index;
  final BuildContext? ctx;
  final OfferModel offerModel;
  final OfferModel? newofferModel;
  const BodyUpdateOfferWidget({
    super.key, required this.txt, required this.index,  this.ctx, required this.offerModel, this.newofferModel,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const IntroUpdateOfferWidget(),
          CardUpdateOfferWidget(
            newofferModel: newofferModel,
            offerModel: offerModel,
            ctx: ctx,
            index: index,
            tex: txt,),
        ],
      ),
    );
  }
}
