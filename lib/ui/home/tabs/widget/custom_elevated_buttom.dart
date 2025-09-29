import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  Color backgrounColor;
  TextStyle? textStyle;
  Color? borderColor;
  Widget? iconImage;
  bool icon;
  MainAxisAlignment? mainAxisAlignment;
  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgrounColor = AppColors.primaryLight,
    this.textStyle,
    this.borderColor,
    this.iconImage,
    this.icon = false,
    this.mainAxisAlignment= MainAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgrounColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor ?? AppColors.primaryLight),
        ),
      ),
      onPressed: onPressed,
      child: icon
          ? Row(
              mainAxisAlignment: mainAxisAlignment!, 
              children: [
                 
                iconImage!,
                SizedBox(height: height * 0.044),

                Padding(
                  padding:   EdgeInsets.symmetric(horizontal: width*0.02),
                  child: Text(text, style: textStyle ?? AppStyles.medium16White),
                ),
              ],
            )
          : Text(text, style: textStyle ?? AppStyles.medium16White),
    );
  }
}
