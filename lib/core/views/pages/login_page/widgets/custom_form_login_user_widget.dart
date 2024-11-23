import 'package:flutter/material.dart';
import 'package:mazaya/core/constent/user_constants.dart';
import 'package:mazaya/core/models/user_model.dart';
import 'package:mazaya/core/viewmodels/user_viewmodel/user_vm.dart';
import 'package:mazaya/core/views/pages/home_page/home_page.dart';
import 'package:mazaya/core/views/widgets/custom_text_form_field_widget.dart';

class CustomFormLoginUserWidget extends StatefulWidget {
  const CustomFormLoginUserWidget({
    super.key,
  });

  @override
  State<CustomFormLoginUserWidget> createState() =>
      _CustomFormLoginUserWidgetState();
}

class _CustomFormLoginUserWidgetState extends State<CustomFormLoginUserWidget> {
  GlobalKey<FormState>? _formKey;
  String? userName;
  String? password;

  TextEditingController? controller;
  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _formKey!.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "اسم المستخدم",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Tajawal",
            ),
          ),
          CustomTextFormFieldWidget(
            onChanged: (data) {
              userName = data;
            },
            prefixIcon: "assets/image/user_name_image.png",
          ),
          const Text(
            "كلمه المرور",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Tajawal",
            ),
          ),
          CustomTextFormFieldWidget(
            checkPassword: true,
            onChanged: (data) {
              password = data;
            },
            prefixIcon: "assets/image/password_image.png",
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (_formKey!.currentState!.validate()) {
                    if (userName == "admin1" && password == "admin1") {
                      UserVm.userLogin(
                          userName: userName!, password: password!);
                      UserVm.add(
                          UserConstants.tableName,
                          UserModel(
                            userName: userName!,
                            password: password!,
                          ));
                      Navigator.pushReplacementNamed(context, HomePage.id,
                          arguments: userName);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          margin: EdgeInsets.all(16),
                          shape: Border(
                            bottom: BorderSide(
                                color: Color(0xffC3AC55),
                                style: BorderStyle.solid),
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: Text("تم تسجيل الدخول")));
                    } else if (userName == "admin2" && password == "admin2") {
                      UserVm.userLogin(
                          userName: userName!, password: password!);
                      UserVm.add(
                          UserConstants.tableName,
                          UserModel(
                              userName: userName!,
                              password: password!,
                              checkAccept: false.toString()));
                      Navigator.pushReplacementNamed(context, HomePage.id,
                          arguments: userName);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          margin: EdgeInsets.all(16),
                          shape: Border(
                            bottom: BorderSide(
                                color: Color(0xffC3AC55),
                                style: BorderStyle.solid),
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: Text("تم تسجيل الدخول")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          margin: EdgeInsets.all(16),
                          shape: Border(
                            bottom: BorderSide(
                                color: Color(0xffC3AC55),
                                style: BorderStyle.solid),
                          ),
                          behavior: SnackBarBehavior.floating,
                          content:
                              Text("أسم المستخدم او كلمة المرور غير صحيحة")));
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff669061),
                            Color(0xff669061),
                            Color(0xffC3AC55),
                          ])),
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Tajawal",
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
