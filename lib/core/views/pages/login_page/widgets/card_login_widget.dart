import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/login_page/widgets/custom_form_login_user_widget.dart';

class CardLoginWidget extends StatelessWidget {
  const CardLoginWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
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
                Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Tajawal",
                      color: Color(0xff669061)),
                ),
                Text(
                  textAlign: TextAlign.right,
                  " لمشغلي النظام استخدم حساب شبكة الجامعة",
                  style: TextStyle(fontFamily: "Tajawal", fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomFormLoginUserWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
