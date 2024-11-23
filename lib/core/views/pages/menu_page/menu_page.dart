import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/constent/user_constants.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/user_viewmodel/user_vm.dart';
import 'package:mazaya/core/views/pages/about_page/about_page.dart';
import 'package:mazaya/core/views/pages/admin_offer_list/admin_offer_list.dart';
import 'package:mazaya/core/views/pages/admin_two_page/admin_two_page.dart';
import 'package:mazaya/core/views/pages/frq_questions_page/frq_questions_page.dart';
import 'package:mazaya/core/views/pages/home_page/home_page.dart';
import 'package:mazaya/core/views/pages/home_page/widgets/intro_button.dart';
import 'package:mazaya/core/views/pages/login_page/login_page.dart';
import 'package:mazaya/core/views/pages/offers_register_page/offers_page.dart';
import 'package:mazaya/core/views/pages/show_message_contact_page/show_message_contact_page.dart';
import 'package:mazaya/core/views/widgets/app_bar_widget.dart';

class MenuPage extends StatefulWidget {
  final String idPage;
  const MenuPage({super.key, required this.idPage});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool? showMenu;
  String? userName;
  @override
  void initState() {
    userName = UserVm.userRead();
    showMenu = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      curve: Curves.bounceInOut,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            const Color(0xff669061).withOpacity(0.9),
            const Color(0xff669061),
            const Color(0xffC3AC55),
          ])),
      duration: const Duration(seconds: 5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: const AppbarWidget(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    userName == "admin1" || userName == "admin2"
                        ? SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Text(
                              textAlign: TextAlign.right,
                              "مرحبا $userName",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: "Tajawal",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    GestureDetector(
                      onTap: () {
                        widget.idPage != HomePage.id
                            ? Navigator.pushNamed(context, HomePage.id,
                                arguments: true)
                            : const SizedBox();
                      },
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: const Text(
                          textAlign: TextAlign.right,
                          "الرئيسية",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.idPage != AboutPage.id
                            ? Navigator.pushNamed(context, AboutPage.id,
                                arguments: true)
                            : const SizedBox();
                      },
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: const Text(
                          textAlign: TextAlign.right,
                          "حول مزايا",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.idPage != FrqQuestionsPage.id
                            ? Navigator.pushNamed(context, FrqQuestionsPage.id,
                                arguments: true)
                            : const SizedBox();
                      },
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: const Text(
                          textAlign: TextAlign.right,
                          "الأسئلة الشائعة",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (userName == null) {
                          widget.idPage != LoginPage.id
                              ? Navigator.pushNamed(context, LoginPage.id,
                                  arguments: true)
                              : const SizedBox();
                        } else {
                          UserVm.userLogout();
                          Navigator.pushNamed(context, HomePage.id);
                        }
                      },
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Text(
                          textAlign: TextAlign.right,
                          userName != null ? "تسجيل الخروج" : "تسجيل الدخول",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.idPage != RegisterOfferPage.id
                            ? Navigator.pushNamed(context, RegisterOfferPage.id,
                                arguments: true)
                            : const SizedBox();
                      },
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: const Text(
                          textAlign: TextAlign.right,
                          "تقديم العرض",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    userName == "admin1" || userName == "admin2"
                        ? GestureDetector(
                            onTap: () {
                              widget.idPage != RegisterOfferPage.id
                                  ? Navigator.pushNamed(
                                      context, ShowMessageContactPage.id,
                                      arguments: true)
                                  : const SizedBox();
                            },
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: const Text(
                                textAlign: TextAlign.right,
                                " معالجة رسائل التواصل",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: "Tajawal",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    userName == "admin1" || userName == "admin2"
                        ? FutureBuilder(
                            future: UserVm.get(UserConstants.tableName),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return GestureDetector(
                                    onTap: () {
                                      widget.idPage != RegisterOfferPage.id
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      userName == "admin2"
                                                          ? AdminTwoPage(
                                                              users:
                                                                  snapshot.data,
                                                              userName:
                                                                  userName,
                                                            )
                                                          : AdminOfferList(
                                                              users: snapshot
                                                                  .data!,
                                                              userName:
                                                                  userName,
                                                            )))
                                          : const SizedBox();
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width,
                                      child: const Text(
                                        textAlign: TextAlign.right,
                                        " معالجة العروض",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: "Tajawal",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Text("there is no data");
                                }
                              } else {
                                return const Text("there is an error");
                              }
                            })
                        : const SizedBox(),
                    // const Spacer(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            child: const Text(
                              textAlign: TextAlign.right,
                              "\tتنويه\n للحصول على الخصم يرجى ابراز البطاقة الجامعية",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: "Tajawal",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: const Text(
                            textAlign: TextAlign.center,
                            "جميع العروض المقدمة من الجهات مزودي الخدمات في الموقع تتحمل مسؤوليتها الجهات المقدمة لهذه العروض دون مسؤولية مباشرة على جامعة الطائف",
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IntroButton(
                        onTap: () {
                          BlocProvider.of<MenuCubitCubit>(context)
                              .showMenu(show: showMenu!);
                          showMenu = !showMenu!;
                        },
                        text: "رجوع")
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
