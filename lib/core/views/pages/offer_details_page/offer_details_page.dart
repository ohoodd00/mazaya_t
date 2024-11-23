import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/pages/offer_details_page/widgets/custom_details_card_widget.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class OfferDetailsPage extends StatelessWidget {
  static String id = "OfferDetailsPage";
  const OfferDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    OfferModel offerModel =
        ModalRoute.of(context)!.settings.arguments as OfferModel;
    return BlocProvider(
      create: (context) => MenuCubitCubit(),
      child: SafeArea(child: Scaffold(
        body: BlocBuilder<MenuCubitCubit, MenuCubitState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  MainBackgroundWidget(
                      idPage: id,
                      hieghtImage: MediaQuery.sizeOf(context).height + 50,
                      image: "assets/image/background_image.png",
                      checkContactUsPage: true,
                      widget: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.15,
                            ),
                            CustomDetialsCardWidget(
                              offerModel: offerModel,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "الرقم المنسق : ${offerModel.number}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "صاحب المنشأه  : ${offerModel.organization}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(" خصم : %${offerModel.discount}"),
                                    Text(
                                        "رقم السجل التجاري : ${offerModel.numberOfCustomer}")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  state is ShowMenu
                      ? MenuPage(
                          idPage: id,
                        )
                      : const SizedBox()
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
