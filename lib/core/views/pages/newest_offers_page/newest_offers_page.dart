import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/pages/newest_offers_page/widgets/list_newest_offers_widget.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class NewestOffersPage extends StatelessWidget {
  const NewestOffersPage({super.key});

  static String id = "NewestOffersPage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubitCubit(),
      child: SafeArea(child: BlocBuilder<MenuCubitCubit, MenuCubitState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                MainBackgroundWidget(
                    idPage: id,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "التعلم و مركز التدريب | تفاصيل العرض ",
                              style: TextStyle(
                                  fontFamily: "Tajawal", color: Colors.white),
                            ),
                            Container(
                              margin: const EdgeInsets.all(15),
                              child: const FittedBox(
                                child: Text(
                                  "أحدث العرض",
                                  style: TextStyle(
                                      fontSize: 1500,
                                      fontFamily: "Tajawal",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const ListNewestOffersWidget(),
                      ],
                    ),
                    checkContactUsPage: false,
                    image: "assets/image/background_image.png",
                    hieghtImage: MediaQuery.sizeOf(context).height + 50),
                state is ShowMenu ? MenuPage(idPage: id) : const SizedBox()
              ],
            ),
          );
        },
      )),
    );
  }
}
