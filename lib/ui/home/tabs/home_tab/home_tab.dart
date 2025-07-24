import 'package:evently/ui/home/tabs/home_tab/widget/event_tab_item.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcomeBack,
                  style: AppStyles.bold12White,
                ),
                Text('Mostafa Mohamed', style: AppStyles.bold24White),
              ],
            ),
            Spacer(),
            ImageIcon(
              AssetImage(AppAssets.iconTheme),
              color: AppColors.whiteColor,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.02),
              padding: EdgeInsets.symmetric(
                vertical: width * 0.02,
                horizontal: height * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
              ),
              child: Text('EN', style: AppStyles.bold16Primary),
            ),
          ],
        ),
        bottom: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          ),
          toolbarHeight: height * 0.11,
          title: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.iconMap,
                    height: height * 0.04,
                    width: width * 0.1,
                  ),
                  Text('Cairo  ,  Eygpt', style: AppStyles.bold14White),
                ],
              ),
              DefaultTabController(
                length: eventsNameList.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: AppColors.transparentColor,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  tabs: eventsNameList.map((eventName) {
                    return EventTabItem(
                      isSelected:
                          selectedIndex == eventsNameList.indexOf(eventName),
                      eventName: eventName,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: height*0.02
              ),
              itemBuilder: (context, index) {
                return EventItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox( height: height*0.02,);
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
