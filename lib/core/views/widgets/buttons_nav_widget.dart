
import 'package:flutter/material.dart';
import 'package:mazaya/core/views/widgets/user_home_phone_icons_widget.dart';

class ButtonNavWidget extends StatelessWidget {
  final String idPage;
  const ButtonNavWidget({
    super.key, required this.idPage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.10,
          child: Image.asset(
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
              "assets/image/img_rectangle_28.png"),
        ),
         Positioned(
          top: -30,
          right: 0,
          left: 0,
          child: UserHomePhoneIconsWidgets(idPage: idPage,),
        ),
      ],
    );
  }
}