import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDateOrTimeWidget extends StatelessWidget {
  String iconDateOrTimeName;
  String eventDateOrTime;
  String chooseDateOrTime;
  VoidCallback onChooseDateOrTimeClicked;
  CustomDateOrTimeWidget({
    super.key,
    required this.onChooseDateOrTimeClicked,
    required this.chooseDateOrTime,
    required this.iconDateOrTimeName,
    required this.eventDateOrTime,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image.asset(iconDateOrTimeName),
        Padding(
          padding:   EdgeInsets.symmetric(horizontal: width*0.02),
          child: Text(eventDateOrTime, style: AppStyles.bold16Black),
        ),
        Spacer(),

        TextButton(
          onPressed: () {
            onChooseDateOrTimeClicked();
          },
          child: Text(chooseDateOrTime, style: AppStyles.medium16Primary),
        ),
      ],
    );
  }
}
