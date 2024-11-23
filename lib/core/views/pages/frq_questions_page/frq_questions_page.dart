import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';
import 'package:mazaya/core/views/pages/frq_questions_page/widgets/body_frq_question_widget.dart';
import 'package:mazaya/core/views/pages/menu_page/menu_page.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class FrqQuestionsPage extends StatelessWidget {
  static String id = "FrqGuestionsPage";
  const FrqQuestionsPage({super.key});

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
                      hieghtImage: MediaQuery.sizeOf(context).height * 0.55,
                      widget: const DodyFrqQuestionWidget(),
                      checkContactUsPage: true,
                      image: "assets/image/frq_question.png"),
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
