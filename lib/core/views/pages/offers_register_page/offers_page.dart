import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/pages/offers_register_page/widgets/body_offers_widget.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class RegisterOfferPage extends StatelessWidget {
  static String id = "OffersPage";
  final int? index;
  final BuildContext? ctx;
  const RegisterOfferPage({this.checkMenuPage, super.key, this.index,  this.ctx,});
  final bool? checkMenuPage;

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
                    // checkMenuPage: checkMenuPage,
                    idPage: id,
                    hieghtImage: MediaQuery.sizeOf(context).height + 50,
                    image: "assets/image/background_image.png",
                    checkContactUsPage: true,
                    widget: BodyOffersWidget(
                      ctx: ctx,
                      index:  index,
                      txt: checkMenuPage,
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
        ),
      )),
    );
  }
}
