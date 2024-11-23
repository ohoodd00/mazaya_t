import 'package:flutter/material.dart';
import 'package:mazaya/core/constent/contact_constants.dart';
import 'package:mazaya/core/models/contact_model.dart';
import 'package:mazaya/core/viewmodels/contact_mv/contact_vm.dart';
import 'package:mazaya/core/views/widgets/custom_text_form_field_widget.dart';

class CustomFormContactUsWidget extends StatefulWidget {
  const CustomFormContactUsWidget({
    super.key,
  });

  @override
  State<CustomFormContactUsWidget> createState() =>
      _CustomFormContactUsWidgetState();
}

class _CustomFormContactUsWidgetState extends State<CustomFormContactUsWidget> {
  static GlobalKey<FormState>? _formKey;
  ContactModel? c;
  String? name, email, title, message;
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
          CustomTextFormFieldWidget(
            hintText: "الاسم",
            onChanged: (data) {
              name = data;
            },
          ),
          CustomTextFormFieldWidget(
            hintText: "البريد الالكتروني",
            onChanged: (data) {
              email = data;
            },
          ),
          CustomTextFormFieldWidget(
            hintText: "عنوان الرسالة",
            onChanged: (data) {
              title = data;
            },
          ),
          CustomTextFormFieldWidget(
            hintText: " الرسالة",
            lines: 5,
            onChanged: (data) {
              message = data;
            },
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
                    ContactVm.add(
                        Constants.tableName,
                        ContactModel(
                            name: name!,
                            email: email!,
                            title: title!,
                            message: message!,
                            onCreate: DateTime.now()));

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("تم ارسال الرسالة")));
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
                    "ارسال الرسالة",
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
