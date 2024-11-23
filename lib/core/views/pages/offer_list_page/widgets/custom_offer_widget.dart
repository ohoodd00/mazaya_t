import 'package:flutter/material.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/views/pages/offer_details_page/offer_details_page.dart';

class CustomOffer extends StatelessWidget {
  final int length;
  final OfferModel offer;
  const CustomOffer({
    super.key,
    required this.offer,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OfferDetailsPage.id, arguments: offer);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            SizedBox(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.50,
                height: MediaQuery.sizeOf(context).height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: MemoryImage(
                          offer.image!,
                        ))),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FittedBox(
              child: Text(
                offer.responsible,
                style: const TextStyle(
                    fontFamily: "Tajawal", fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FittedBox(
              child: Text(
                offer.goalCategroy,
                style: const TextStyle(
                  fontFamily: "Tajawal",
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text("%${offer.discount}")
          ],
        ),
      ),
    );
  }
}
