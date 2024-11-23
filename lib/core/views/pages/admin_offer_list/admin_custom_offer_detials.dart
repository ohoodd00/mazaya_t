import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/models/user_model.dart';
import 'package:mazaya/core/viewmodels/contact_mv/offer_vm.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/viewmodels/user_viewmodel/user_vm.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/pages/offer_details_page/widgets/custom_details_card_widget.dart';
import 'package:mazaya/core/views/pages/update_offers_page/update_offers_page.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';
import 'package:mazaya/helpers/db_helper.dart';

class AdminCustomOfferDetials extends StatelessWidget {
  static String id = "AdminCustomOfferDetials";
  final OfferModel? newOffferModel;
  final OfferModel? offerModel;
  final List<UserModel>? users;
  const AdminCustomOfferDetials(
      {super.key, this.newOffferModel, this.offerModel, this.users});

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: AlertDialog(
                                                title: const Text('رفض العرض'),
                                                content: const SizedBox(),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('رفض '),
                                                    onPressed: () {
                                                      if (newOffferModel !=
                                                          null) {
                                                        DbHelper().delete(
                                                            OfferConstants
                                                                .newtableName,
                                                            newOffferModel!
                                                                .id!);
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16),
                                                                shape: Border(
                                                                  bottom: BorderSide(
                                                                      color: Color(
                                                                          0xffC3AC55),
                                                                      style: BorderStyle
                                                                          .solid),
                                                                ),
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                content: Text(
                                                                    "تم رفض من العرض")));
                                                      } else {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16),
                                                                shape: Border(
                                                                  bottom: BorderSide(
                                                                      color: Color(
                                                                          0xffC3AC55),
                                                                      style: BorderStyle
                                                                          .solid),
                                                                ),
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                content: Text(
                                                                    "لايوجد عرض للرفض")));
                                                      }
                                                      // BlocProvider.of<DeleteContactCubit>(ctx).stateDelete(index);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child:
                                                        const Text('  تراجع'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: const Text("رفض")),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateOffersPage(
                                                    offerModel: offerModel,
                                                    newofferModel:
                                                        newOffferModel,
                                                  )));
                                    },
                                    child: const Text("تعديل")),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black),
                                    onPressed: () {
                                      if (UserVm.userRead() == "admin1") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                margin: EdgeInsets.all(16),
                                                shape: Border(
                                                  bottom: BorderSide(
                                                      color: Color(0xffC3AC55),
                                                      style: BorderStyle.solid),
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                    "تمت الموافقة من مسؤول النظام سوف تتم المعالجة من قبل معتمد النظام")));

                                        OfferVm.add(
                                            OfferConstants.admintableName,
                                            offerModel!);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                margin: EdgeInsets.all(16),
                                                shape: Border(
                                                  bottom: BorderSide(
                                                      color: Color(0xffC3AC55),
                                                      style: BorderStyle.solid),
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content:
                                                    Text("تم قبول العرض")));
                                      }
                                    },
                                    child: const Text("قبول")),
                              ],
                            ),
                            CustomDetialsCardWidget(
                              offerModel: offerModel!,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "رقم المنسق : ${offerModel!.number}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "المنشأة  : ${offerModel!.organization}",
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
                                    Text(" خصم : %${offerModel!.discount}"),
                                    Text(
                                        "رقم السجل التجاري : ${offerModel!.numberOfCustomer}")
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
