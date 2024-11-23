import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/home_page/widgets/body_home_page_widget.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class HomePage extends StatelessWidget {
  static bool checkHomePage = true;
  static String id = "HomePage";
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubitCubit(),
      child: SafeArea(
        child: BlocBuilder<MenuCubitCubit, MenuCubitState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  MainBackgroundWidget(
                      idPage: id,
                      hieghtImage: MediaQuery.sizeOf(context).height + 50,
                      image: "assets/image/background_image.png",
                      checkContactUsPage: false,
                      widget: const BodyHomePageWidget()),
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
      ),
    );
  }
}
