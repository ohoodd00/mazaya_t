import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/login_page/widgets/card_login_widget.dart';
import 'package:mazaya/core/views/pages/login_page/widgets/intro_login_widget.dart';

class BodyLoginPageWidget extends StatelessWidget {
  const BodyLoginPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          IntroLoginWidget(),
          CardLoginWidget(),
          Spacer(),
        ],
      ),
    );
  }
}
