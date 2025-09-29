import 'package:evently/utils/App_Colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef onValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.colorBorderSide = AppColors.greyColor,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    this.prefixIcon,
    this.suiffixIcon,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscuringCharacter ,
    this.maxLines 

  });
      int? maxLines;

  Color colorBorderSide;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suiffixIcon;
  onValidator validator;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  String? obscuringCharacter;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return TextFormField(
      maxLines: maxLines ?? 1// دي بتحدد انت عايز كام سطر ونا بعتها كدا عشان لو عايز اغيرها اغيرها مش عايز يبقي القيمه 1
      ,
      decoration: InputDecoration(
        enabledBorder: buildDecorationBorder(
          colorBorderSide: colorBorderSide,
        ),
        focusedBorder: buildDecorationBorder(
          colorBorderSide: colorBorderSide,
        ),
        errorBorder: buildDecorationBorder(
          colorBorderSide: AppColors.redColor,
        ),
        focusedErrorBorder: buildDecorationBorder(
          colorBorderSide: AppColors.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.medium16Grey,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.medium16Grey,
        prefixIcon: prefixIcon,
        suffixIcon: suiffixIcon,
        
        errorStyle: AppStyles.medium16Primary.copyWith(
          color: AppColors.redColor,
        ),
      ),
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText , 
      obscuringCharacter: obscuringCharacter ?? '.' ,
    );
  }

  OutlineInputBorder buildDecorationBorder({required colorBorderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: colorBorderSide, width: 1),
    );
  }
}
