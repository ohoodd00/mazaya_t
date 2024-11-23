import 'package:flutter/material.dart';
import 'package:mazaya/core/models/category_model.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/views/pages/offer_list_page/offer_list_page.dart';

class CatergoryWidget extends StatelessWidget {
  final CategoryModel category;
  final List<OfferModel> offer;
  const CatergoryWidget({
    super.key,
    required this.category,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    bool isDateDone(DateTime date) {
      DateTime now = DateTime.now();
      return date.isBefore(now); // Returns true if date is in the past
    }

    List<OfferModel> moverOffers = [];
    for (var element in offer) {
      if (element.catergroy == category.title && !isDateDone(element.endDate!)) {
        moverOffers.add(element);
      }
    }
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          OfferListPage.id,
          arguments: moverOffers,
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.7,
        height: MediaQuery.sizeOf(context).height * 0.10,
        margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            leading: Image.asset(
              category.image,
              width: MediaQuery.sizeOf(context).width * 0.10,
            ),
            title: Text(category.title,
                style: const TextStyle(fontFamily: "Tajawal")),
            subtitle: Text(category.subtitle,
                style: const TextStyle(fontFamily: "Tajawal")),
          ),
        ),
      ),
    );
  }
}
