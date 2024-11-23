import 'package:flutter/material.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/models/user_model.dart';
import 'package:mazaya/core/viewmodels/contact_mv/offer_vm.dart';
import 'package:mazaya/core/views/pages/admin_two_page/admin_two_custom_offer.dart';

class AdminTwoOfferFutureBuilder extends StatelessWidget {
  final List<OfferModel> newOffferModel;
  final String userName;
  final List<UserModel> users;
  const AdminTwoOfferFutureBuilder({
    super.key,
    required this.newOffferModel,
    required this.userName,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: OfferVm.get(OfferConstants.admintableName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "معتمد النظام",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Tajawal"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: const FittedBox(
                          child: Text(
                            "معالجة جميع العروض",
                            style: TextStyle(
                                fontSize: 1500,
                                fontFamily: "Tajawal",
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        child: GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.7,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: AdminTwoCustomOffer(
                                  newOffferModel: newOffferModel,
                                  length: snapshot.data!.length,
                                  offer: snapshot.data![index],
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("لايوجد عروض"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return const SizedBox();
          }
        });
  }
}
