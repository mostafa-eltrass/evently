import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/model/event.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_tab_item.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_item.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    if (eventListProvider.eventsList.isEmpty) {
      eventListProvider.getAllEvents();
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
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
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
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
                length: eventListProvider.eventsNameList.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: AppColors.transparentColor,
                  onTap: (index) {
                    eventListProvider.changeSelectedIndex(index);
                    setState(() {});
                  },
                  tabs: eventListProvider.eventsNameList.map((eventName) {
                    return EventTabItem(
                      selectedTextStyle: Theme.of(
                        context,
                      ).textTheme.headlineMedium!,
                      unSelectedTextStyle: Theme.of(
                        context,
                      ).textTheme.headlineSmall!,
                      selectedBgColor: Theme.of(context).focusColor,
                      isSelected:
                         eventListProvider. selectedIndex ==
                          eventListProvider.eventsNameList.indexOf(eventName),
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
            child: eventListProvider.filterEventList.isEmpty ?
              Center(
                child: Text(AppLocalizations.of(context)!.notFoundEvent,
                style: AppStyles.bold20Primary,
                ),
              )
            
           : ListView.separated(
              padding: EdgeInsets.only(top: height * 0.02),
              itemBuilder: (context, index) {
                return EventItem(event: eventListProvider.filterEventList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: eventListProvider.filterEventList.length,
            ),
          ),
        ],
      ),
    );
  }
}
