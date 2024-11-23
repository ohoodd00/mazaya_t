

import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/show_message_contact_page/widgets/show_message_future_builder_widget.dart';
import 'package:mazaya/core/views/widgets/main_background_widget.dart';

class ShowMessageBodyWidget extends StatelessWidget {
  const ShowMessageBodyWidget({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return MainBackgroundWidget(
      // checkMenuPage: checkMenuPage,
      idPage: id,
      hieghtImage: MediaQuery.sizeOf(context).height + 50,
      image: "assets/image/background_image.png",
      checkContactUsPage: true,
      widget: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.9,
            child: const ShowMessageFutureBuilderWidget(),
          ),
        ],
      ),
    );
  }
}
