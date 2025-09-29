import 'package:evently/model/event.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  Event event;
  EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      height: height * 0.31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(event.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.02,
            ),
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Column(
              children: [
                Text(
                  event.dateTime.day.toString(),
                  style: AppStyles.bold20Primary,
                ),
                Text(
                  DateFormat('MMM').format(event.dateTime),
                  style: AppStyles.bold14Primary,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.02,
            ),
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(event.title, style: AppStyles.bold14Primary),
                ),
                InkWell(
                  onTap: () {
                    eventListProvider.updateIsFavorite(event);
                  },
                  child: event.isFavorite == true ? Image.asset(AppAssets.iconFavoriteSelected,
                  color: AppColors.primaryLight,
                  )
                  :
                   Image.asset(
                    AppAssets.iconFavorite,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
