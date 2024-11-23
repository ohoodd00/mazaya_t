import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String? prefixIcon;
  final Function(String) onChanged;
  final bool? checkPassword;
  final String? hintText;
  final int? lines;
  final TextInputType? number;
  const CustomTextFormFieldWidget({
    super.key,
    this.prefixIcon,
    required this.onChanged,
    this.checkPassword,
    this.hintText,
    this.lines,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          keyboardType: number,
          validator: (value) {
            if (value!.isEmpty) {
              return "يجب ادخال الحقل";
            } else {
              return null;
            }
          },
          obscureText: checkPassword ?? false,
          onChanged: onChanged,
          maxLines: lines ?? 1,
          minLines: lines ?? 1,
          cursorColor: const Color(0xff669061),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                        width: MediaQuery.sizeOf(context).width * 0.10,
                        prefixIcon!),
                  )
                : const SizedBox(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(style: BorderStyle.solid, color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(style: BorderStyle.solid, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
