import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/contact_us_page/widgets/custom_form_contact_us_widget.dart';

class CardContactUsWidget extends StatelessWidget {
  const CardContactUsWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 35,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomFormContactUsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
