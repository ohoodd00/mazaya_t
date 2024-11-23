import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/offers_register_page/widgets/cutsom_form_offer_widget.dart';

class CardOffersWidget extends StatelessWidget {
  final bool? tex;
  final int? index;
  final BuildContext? ctx;
  const CardOffersWidget({
    super.key, required this.tex, this.index,  this.ctx,
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
                  CutsomFormOfferWidget(
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
