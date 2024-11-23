import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/models/user_model.dart';
import 'package:mazaya/core/viewmodels/contact_mv/offer_vm.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/admin_offer_list/admin_offer_future_builder.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class AdminOfferList extends StatefulWidget {
  static String id = "AdminOfferList";
  final String? userName;
  final List<UserModel>? users;
  const AdminOfferList({super.key, this.userName,  this.users});
  @override
  State<AdminOfferList> createState() => _OfferKidePageState();
}

class _OfferKidePageState extends State<AdminOfferList> {
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
                    idPage: AdminOfferList.id,
                    hieghtImage: MediaQuery.sizeOf(context).height + 50,
                    image: "assets/image/background_image.png",
                    checkContactUsPage: true,
                    widget: FutureBuilder(
                        future: OfferVm.get(OfferConstants.newtableName),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done) {
                            if (snapshot.hasData) {
                              
                              return AdminOfferFutureBuilder(
                                users: widget.users!,
                                userName: widget.userName!,
                                newOffferModel: snapshot.data!.isEmpty
                                    ? []
                                    : snapshot.data!,
                              );
                            } else {
                              return const SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          } else {
                            return const SizedBox(
                              child: Center(
                                child: Text("لايوجد اتصال"),
                              ),
                            );
                          }
                        }),
                  ),
                  state is ShowMenu
                      ? MenuPage(
                          idPage: AdminOfferList.id,
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
