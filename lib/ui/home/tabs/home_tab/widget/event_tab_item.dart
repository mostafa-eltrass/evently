import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
    bool isSelected;
    String eventName;

   EventTabItem({
     
    required this.isSelected,
    required this.eventName,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      margin: const EdgeInsets.symmetric(
        horizontal:0.3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: Theme.of(context).focusColor, width: 2),
        color: isSelected
            ? Theme.of(context).focusColor
            : AppColors.transparentColor,
      ),
      child: Text(
        eventName,
        style: isSelected
            ? Theme.of(context).textTheme.headlineMedium
            : Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white), // ← تأكيد اللون
      ),
    );
  }
}
