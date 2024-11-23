import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/cubit/add_offer_cubit/add_offer_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/delete_offer_cubit/delete_offer_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/delete_offer_cubit/delete_offer_state.dart';
import 'package:mazaya/core/views/pages/offer_list_page/widgets/custom_offer_widget.dart';

class CustomOfferListWidget extends StatelessWidget {
  final List<OfferModel> offer;
  const CustomOfferListWidget({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddOfferCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteOfferCubit(),
        ),
      ],
      child: BlocBuilder<DeleteOfferCubit, DeleteOfferState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: GridView.builder(
                  itemCount: offer.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CustomOffer(
                      length: offer.length,
                      offer: offer[index],
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
