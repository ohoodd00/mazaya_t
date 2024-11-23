import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/contact_mv/offer_vm.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/models/data/category_data.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/pages/offer_category_page/widgets/catergory_widget.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class OfferKidePage extends StatefulWidget {
  static String id = "Offerkidepage";
  static List<OfferModel> offerList = [];
  static int i = 0;
  const OfferKidePage({super.key});

  @override
  State<OfferKidePage> createState() => _OfferKidePageState();
}

class _OfferKidePageState extends State<OfferKidePage> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubitCubit(),
      child: SafeArea(child: Scaffold(
        body: BlocBuilder<MenuCubitCubit, MenuCubitState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  MainBackgroundWidget(
                    idPage: OfferKidePage.id,
                    hieghtImage: MediaQuery.sizeOf(context).height + 50,
                    image: "assets/image/background_image.png",
                    checkContactUsPage: true,
                    widget: FutureBuilder(
                        future: OfferVm.get(OfferConstants.newtableName),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              for (var element in snapshot.data!) {
                                OfferKidePage.offerList.add(element);
                              }
                              OfferKidePage.i = OfferKidePage.offerList.length;
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.10,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(15),
                                        child: const FittedBox(
                                          child: Text(
                                            "تصنيفات العروض",
                                            style: TextStyle(
                                                fontSize: 1500,
                                                fontFamily: "Tajawal",
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        " اختر التصنيف لاستعراض العروض الخاصه بة",
                                        style: TextStyle(
                                            fontFamily: "Tajawal",
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: CategoryData.category.length,
                                        itemBuilder: (context, index) {
                                          return CatergoryWidget(
                                            offer: snapshot.data!,
                                            category:
                                                CategoryData.category[index],
                                          );
                                        }),
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
                        }),
                  ),
                  state is ShowMenu
                      ? MenuPage(
                          idPage: OfferKidePage.id,
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
