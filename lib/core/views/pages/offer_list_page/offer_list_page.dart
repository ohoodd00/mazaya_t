import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/cubit/add_offer_cubit/add_offer_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/add_offer_cubit/add_offer_state.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/pages/offer_list_page/widgets/custom_intro_widget.dart';
import 'package:mazaya/core/views/pages/offer_list_page/widgets/custom_list_offer_widget.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class OfferListPage extends StatelessWidget {
  static String id = "OfferListPage";
  const OfferListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<OfferModel> offer =
        ModalRoute.of(context)!.settings.arguments as List<OfferModel>;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuCubitCubit(),
        ),
        BlocProvider(
          create: (ctx) => AddOfferCubit(),
        ),
      ],
      child: SafeArea(child: Scaffold(
        body: BlocBuilder<AddOfferCubit, AddOfferState>(
          builder: (ctx, state) {
            return BlocBuilder<MenuCubitCubit, MenuCubitState>(
              builder: (context, state) {
                return Scaffold(
                  body: Stack(
                    children: [
                      MainBackgroundWidget(
                        idPage: id,
                        hieghtImage: MediaQuery.sizeOf(context).height + 50,
                        image: "assets/image/background_image.png",
                        checkContactUsPage: true,
                        widget: offer.isNotEmpty
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.15,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.25,
                                    child: CustomIntroWidget(
                                      offerList: offer[0].catergroy,
                                    ),
                                  ),
                                  CustomOfferListWidget(
                                    offer: offer,
                                  )
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: SizedBox(
                                  height: MediaQuery.sizeOf(context).height,
                                  child: const Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            "لايوجد عروض متوفرة",
                                            style: TextStyle(
                                              fontFamily: "Tajawal",
                                              color: Colors.white,
                                              fontSize: 1500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      state is ShowMenu
                          ? MenuPage(
                              idPage: id,
                            )
                          : const SizedBox()
                    ],
                  ),
                );
              },
            );
          },
        ),
      )),
    );
  }
}
