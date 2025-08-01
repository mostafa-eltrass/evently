import 'package:evently/utils/App_Colors.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:evently/model/event.dart';
import 'package:evently/firebase_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> eventsList = [];
  List<Event> filterEventList = [];
  List<String> eventsNameList = [];
  List<Event> favoriteEventList = [];
  int selectedIndex = 0;

  List<String> getEventNameList(BuildContext context) {
    return eventsNameList = [
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
  }

  void getAllEvents() async {
    try {
      QuerySnapshot<Event> querySnapshot =
          await FirebaseUtils.getEventsCollection().get();

      eventsList = querySnapshot.docs
          .map((doc) => doc.data())
          .whereType<Event>()
          .toList();

      filterEventList = List<Event>.from(eventsList);
      filterEventList.sort((event1, event2) {
        return event1.dateTime.compareTo(event2.dateTime);
      });
      notifyListeners();
    } catch (e, stack) {
      debugPrint("❌ Error in getAllEvents: $e\n$stack");
    }
  }

  void getFilterEvents() async {
    try {
      QuerySnapshot<Event> querySnapshot =
          await FirebaseUtils.getEventsCollection().get();

      eventsList = querySnapshot.docs
          .map((doc) => doc.data())
          .whereType<Event>()
          .toList();

      filterEventList = eventsList.where((event) {
        return event.eventName == eventsNameList[selectedIndex];
      }).toList();

      filterEventList.sort((event1, event2) {
        return event1.dateTime.compareTo(event2.dateTime);
      });

      notifyListeners();
    } catch (e, stack) {
      debugPrint("❌ Error in getFilterEvents: $e\n$stack");
    }
  }

  void updateIsFavorite(Event event) {
    FirebaseUtils.getEventsCollection()
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite})
        .timeout(
          const Duration(milliseconds: 500),
          onTimeout: () {
            ToastUtils.toastMsg(
              msg: 'Event Update Sucsessfully',
              backgroundColor: AppColors.primaryLight,
              textColor: AppColors.whiteColor,
            );
          },
        );
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
    getAllFavoriteEventList();
    notifyListeners();
  }

  void getAllFavoriteEventList() async {
    try {
      var querySnapshot = await FirebaseUtils.getEventsCollection().get();

      eventsList = querySnapshot.docs
          .map((doc) => doc.data())
          .whereType<Event>()
          .toList();

      favoriteEventList = eventsList.where((event) {
        return (event.isFavorite ?? false) == true;
      }).toList();

      debugPrint("❤️ Favorite Events Count: ${favoriteEventList.length}");
      notifyListeners();
    } catch (e, stack) {
      debugPrint("❌ Error in getAllFavoriteEventList: $e\n$stack");
    }
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
  }
}
