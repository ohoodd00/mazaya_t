import 'package:flutter/material.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/check_notification_vm/check_notification_vm.dart';
import 'package:mazaya/core/views/pages/admin_two_page/admin_custom_offer_detials.dart';

class AdminTwoCustomOffer extends StatelessWidget {
  final int length;
  final OfferModel offer;
  // final List<UserModel> users;
  final List<OfferModel> newOffferModel;
  static List<OfferModel> newFuckingOffer = [];
  const AdminTwoCustomOffer({
    super.key,
    required this.offer,
    required this.length,
    required this.newOffferModel,
    //  required this.users,
  });
  OfferModel? getOfferIndex() {
    int i = 0;
    OfferModel? offers;
    if (newOffferModel.isNotEmpty) {
      for (i; i < newOffferModel.length; i++) {
        if (newOffferModel[i].responsible == offer.responsible) {
          offers = newOffferModel[i];
          break;
        }
      }
    }
    return offers;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AdminTwoCustomOfferDetials(
                      // users: users,
                      offerModel: offer,
                      newOffferModel: getOfferIndex(),
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            CheckNotificationVm.isDateDone(offer.endDate!)
                ? Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "العرض منتهي",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                : const SizedBox(),
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
