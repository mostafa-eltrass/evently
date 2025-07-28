import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;
  Color? borderColor;
  Color selectedBgColor;
   TextStyle selectedTextStyle;
   TextStyle  unSelectedTextStyle;
  EventTabItem({
    required this.isSelected,
    required this.eventName,
    required this.selectedBgColor,
    this.borderColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle
    
     
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 0.3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          color: borderColor ?? Theme.of(context).focusColor,
          width: 2,
        ),
        color: isSelected
            ? selectedBgColor
            : AppColors.transparentColor,
      ),
      child: Text(
        eventName,
        style: isSelected
            ? selectedTextStyle
            : unSelectedTextStyle // ← تأكيد اللون
      ),
    );
  }
}
