import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/frq_questions_page/widgets/intro_frq_question_widget.dart';
import 'package:mazaya/core/views/pages/frq_questions_page/widgets/question_widget.dart';
import 'package:mazaya/core/views/pages/frq_questions_page/widgets/send_frq_button_wiget.dart';

class DodyFrqQuestionWidget extends StatelessWidget {
  const DodyFrqQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
          const IntroFrqQuestionWidget(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
          ),
          const QuestionWidget(
            question: "من هي الفئة المستهدفة ؟",
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.right,
              // style: TextStyle(color: Colors.white),
              "الفئة المستفيدة هي منسوبي الجامعة (موظفين - أعضاء هيئة التدريس - الطلاب)",
            ),
          ),
          const QuestionWidget(
            question: "ما هو دور منصة مزايا؟",
          ),
          const QuestionWidget(
            question: "كيف يمكن لطلاب ومنسوبي الجامعة الاستفادة من العروض؟",
          ),
          const QuestionWidget(
            question: "كيف يتم معرفة العروض المتاحة؟",
          ),
          Image.asset(
              width: MediaQuery.sizeOf(context).width * 0.3,
              "assets/image/answer.png"),
          const Text(
            textAlign: TextAlign.center,
            "تريد الإجابة على جميع استفساراتك. \nتواصل معنا وسيتم الرد في أقرب وقت ممكن.",
          ),
          const SizedBox(
            height: 15,
          ),
          const SendFrqButton(),
        ],
      ),
    );
  }
}
