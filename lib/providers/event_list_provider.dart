import 'package:flutter/material.dart';
import 'package:evently/model/event.dart';
import 'package:evently/firebase_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> eventsList = [];
  List<Event> filterEventList = [];
  List<String> eventsNameList = [];
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
      // 📌 ← هنا التعديل: أضفنا try-catch للتعامل مع أي خطأ
      QuerySnapshot<Event> querySnapshot =
          await FirebaseUtils.getEventsCollection().get();

      eventsList = querySnapshot.docs
          .map((doc) => doc.data()) // 📌 ← هنا التعديل: نحصل على كل حدث
          .whereType<Event>() // 📌 ← هنا التعديل: نتأكد إن النوع Event فعلاً
          .toList(); // 📌 ← هنا التعديل: نحولهم لقائمة

      filterEventList = List<Event>.from(
        eventsList,
      ); 
      filterEventList.sort((event1, event2) {
        return event1.dateTime.compareTo(event2.dateTime);
      });// 📌 ← هنا التعديل: نسخة لفلاتر
      notifyListeners();
    } catch (e, stack) {
      // 📌 ← هنا التعديل: catch لإظهار الخطأ
      debugPrint("❌ Error in getAllEvents: $e\n$stack"); // 📌 ← هنا التعديل
    }
  }

  void getFilterEvents() async {
    try {
      // 📌 ← هنا التعديل
      QuerySnapshot<Event> querySnapshot =
          await FirebaseUtils.getEventsCollection().get(); // COLLECTION
      // COLLECTIONS
      // DATA
      // FILTER

      eventsList = querySnapshot.docs
          .map((doc) => doc.data()) // 📌 ← هنا التعديل
          .whereType<Event>() // 📌 ← هنا التعديل      DATA
          .toList(); // 📌 ← هنا التعديل

      filterEventList = eventsList.where((event) {
        return event.eventName == eventsNameList[selectedIndex]; // FILTER
      }).toList();

      notifyListeners();
      filterEventList.sort((event1, event2) {
        return event1.dateTime.compareTo(event2.dateTime);
      });
    } catch (e, stack) {
      // 📌 ← هنا التعديل
      debugPrint("❌ Error in getFilterEvents: $e\n$stack"); // 📌 ← هنا التعديل
    }
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
  }
}
