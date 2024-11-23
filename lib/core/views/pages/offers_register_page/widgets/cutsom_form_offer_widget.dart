import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/models/data/category_data.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/contact_mv/offer_vm.dart';
import 'package:mazaya/core/views/pages/home_page/home_page.dart';
import 'package:mazaya/core/views/widgets/custom_text_form_field_widget.dart';

class CutsomFormOfferWidget extends StatefulWidget {
  final bool? tex;
  const CutsomFormOfferWidget({
    super.key,
    required this.tex,
  });

  @override
  State<CutsomFormOfferWidget> createState() => _CutsomFormOfferWidgetState();
}

class _CutsomFormOfferWidgetState extends State<CutsomFormOfferWidget> {
  // static bool chekListTile = false;
  static GlobalKey<FormState>? _formKey;
  String? catergroy;
  String? catergroy2;
  String? goalCategroy;
  String? organization;
  String? numberOfCustomer;
  String? city;
  String? discount;
  String? branches;
  DateTime? startDate;
  DateTime? endDate;
  String? name;
  String? number;
  String? imagee;
  Uint8List? getImagee;
  String? responsible;

  Future<Uint8List?> getImage() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    Uint8List imageByte = await image.readAsBytes();
    imagee = 'kjk';
    setState(() {});
    return imageByte;
  }

  List<String> oragranzation = [
    " خاصة",
    " حكومية",
  ];
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
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey, style: BorderStyle.solid),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: DropdownButton<String>(
                value: catergroy, // This can be null initially
                hint: const Text("اختر الفئة"), // Optional hint text
                items: CategoryData.category.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.title,
                    child: Text(category.title),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    catergroy = newValue; // Update the selected value
                  });
                },
              ),
            ),
          ),
          CustomTextFormFieldWidget(
            hintText: "مقدم العرض",
            onChanged: (data) {
              responsible = data;
            },
          ),
          CustomTextFormFieldWidget(
            hintText: "الفئة المستهدفة",
            onChanged: (data) {
              goalCategroy = data;
            },
          ),
          GestureDetector(
            onTap: () async {
              getImagee = await getImage();
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey, style: BorderStyle.solid),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: imagee == null
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.download,
                        ),
                        Text("اضافة صورة للعرض "),
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.thumb_up_rounded,
                          color: Colors.green,
                        ),
                        Text(" تم اضافة الصورة"),
                      ],
                    ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey, style: BorderStyle.solid),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: DropdownButton<String>(
                value: organization, // This can be null initially
                hint: const Text("المنشـأة "), // Optional hint text
                items: oragranzation.map((organization) {
                  return DropdownMenuItem<String>(
                    value: organization,
                    child: Text(organization),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    organization = newValue; // Update the selected value
                  });
                },
              ),
            ),
          ),
          CustomTextFormFieldWidget(
            number: TextInputType.number,
            hintText: "رقم السجل التجاري",
            onChanged: (data) {
              numberOfCustomer = data;
            },
          ),
          CustomTextFormFieldWidget(
            hintText: "المدينة",
            onChanged: (data) {
              city = data;
            },
          ),
          CustomTextFormFieldWidget(
            number: TextInputType.number,
            hintText: "مقدار الخصم",
            onChanged: (data) {
              discount = data;
            },
          ),
          CustomTextFormFieldWidget(
            hintText: "الفروع المقدمة للخصمد",
            onChanged: (data) {
              branches = data;
            },
          ),
          GestureDetector(
            onTap: () async {
              startDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050));
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey, style: BorderStyle.solid),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: startDate != null
                  ? Text(
                      "${startDate!.year}/${startDate!.month}/${startDate!.day}")
                  : const Text("تاريخ بداية العرض"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              endDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050));
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey, style: BorderStyle.solid),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: endDate != null
                  ? Text("${endDate!.year}/${endDate!.month}/${endDate!.day}")
                  : const Text("تاريخ نهاية العرض"),
            ),
          ),
          CustomTextFormFieldWidget(
            hintText: "اسم الشخص المنسق",
            onChanged: (data) {
              name = data;
            },
          ),
          CustomTextFormFieldWidget(
            number: TextInputType.number,
            hintText: "رقم الهاتف",
            onChanged: (data) {
              number = data;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (_formKey!.currentState!.validate()) {
                    if (getImagee != null) {
                      if (catergroy == null &&
                          startDate == null &&
                          endDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                margin: EdgeInsets.all(16),
                                shape: Border(
                                  bottom: BorderSide(
                                      color: Color(0xffC3AC55),
                                      style: BorderStyle.solid),
                                ),
                                behavior: SnackBarBehavior.floating,
                                content:
                                    Text("  تحقق من ادخال جميع البيانات ")));
                      } else {
                        if (widget.tex != null && widget.tex!) {
                          OfferVm.add(
                              OfferConstants.tableName,
                              OfferModel(
                                  catergroy: catergroy!,
                                  responsible: responsible!,
                                  goalCategroy: goalCategroy!,
                                  organization: organization!,
                                  numberOfCustomer: numberOfCustomer!,
                                  city: city!,
                                  discount: discount!,
                                  branches: branches!,
                                  startDate: startDate!,
                                  endDate: endDate!,
                                  name: name!,
                                  number: number!,
                                  image: getImagee!));
                        } else {
                          OfferVm.add(
                              OfferConstants.tableName,
                              OfferModel(
                                  responsible: responsible!,
                                  catergroy: catergroy!,
                                  goalCategroy: goalCategroy!,
                                  organization: organization!,
                                  numberOfCustomer: numberOfCustomer!,
                                  city: city!,
                                  discount: discount!,
                                  branches: branches!,
                                  startDate: startDate!,
                                  endDate: endDate!,
                                  name: name!,
                                  number: number!,
                                  image: getImagee!));
                        }
                        Navigator.pushReplacementNamed(context, HomePage.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                margin: EdgeInsets.all(16),
                                shape: Border(
                                  bottom: BorderSide(
                                      color: Color(0xffC3AC55),
                                      style: BorderStyle.solid),
                                ),
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                    "سوف يتم معالجة العرض من قبل المشرف ")));
                      }
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff669061),
                            Color(0xff669061),
                            Color(0xffC3AC55),
                          ])),
                  child: const Text(
                    "ارسال ",
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
