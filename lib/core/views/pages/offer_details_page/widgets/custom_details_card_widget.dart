import 'package:flutter/material.dart';
import 'package:mazaya/core/models/offer_model.dart';

class CustomDetialsCardWidget extends StatelessWidget {
  final OfferModel offerModel;
  const CustomDetialsCardWidget({
    super.key,
    required this.offerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).height * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: MemoryImage(
                      offerModel.image!,
                    ),
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  offerModel.catergroy,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(offerModel.organization!),
                Text(
                    "من تاريخ : ${offerModel.startDate!.year}/${offerModel.startDate!.month}/${offerModel.startDate!.day}"),
                Text(
                    "الئ تاريخ : ${offerModel.endDate!.year}/${offerModel.endDate!.month}/${offerModel.endDate!.day}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
