import 'package:flutter/material.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/views/pages/update_offers_page/widgets/custom_update_form_offer_widget.dart';

class CardUpdateOfferWidget extends StatelessWidget {
  final bool? tex;
  final int? index;
  final BuildContext? ctx;
  final OfferModel offerModel;
  final OfferModel? newofferModel;
  const CardUpdateOfferWidget({
    super.key, required this.tex, this.index,  this.ctx, required this.offerModel, this.newofferModel,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 35,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomUpdateFormOfferWidget(
                    newoffer: newofferModel,
                    offer: offerModel,
                    tex: tex,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
