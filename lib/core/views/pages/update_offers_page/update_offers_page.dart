import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/pages/update_offers_page/widgets/body_update_offer_widget.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class UpdateOffersPage extends StatelessWidget {
  static String id = "UpdateOffersPage";
  final int? index;
  final OfferModel? offerModel;
  final OfferModel? newofferModel;
  final BuildContext? ctx;
  const UpdateOffersPage({
    this.checkMenuPage,
    super.key,
    this.index,
    this.ctx, this.offerModel, this.newofferModel,
  });
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
                    widget: BodyUpdateOfferWidget(
                      newofferModel: newofferModel,
                      offerModel: offerModel!,
                      ctx: ctx,
                      index: index,
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
