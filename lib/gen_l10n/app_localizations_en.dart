// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get theme => 'Theme';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get arabic => 'Arabic';

  @override
  String get logout => 'Logout';

  @override
  String get personalizeTitle => 'Personalize Your Experience';

  @override
  String get personalizeDesc =>
      'Choose your preferred theme and language to\nget started with a comfortable, tailored\nexperience that suits your style.';

  @override
  String get letsStart => 'Let’s Start';

  @override
  String get onboardTitle1 => 'Find Events That Inspire You';

  @override
  String get onboardDesc1 =>
      'Dive into a world of events crafted to fit your unique interests. Whether you are into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.';

  @override
  String get onboardTitle2 => 'Effortless Event Planning';

  @override
  String get onboardDesc2 =>
      'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.';

  @override
  String get onboardTitle3 => 'Connect with Friends & Share Moments';

  @override
  String get onboardDesc3 =>
      'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.';

  @override
  String get all => 'All';

  @override
  String get sport => 'Sport';

  @override
  String get birthday => 'Birthday';

  @override
  String get meeting => 'Meeting';

  @override
  String get gaming => 'Gaming';

  @override
  String get workshop => 'Workshop';

  @override
  String get bookClub => 'Book Club';

  @override
  String get exhibition => 'Exhibition';

  @override
  String get holiday => 'Holiday';

  @override
  String get eating => 'Eating';

  @override
  String get home => 'Home';

  @override
  String get map => 'Map';

  @override
  String get favorite => 'Favorite';

  @override
  String get profile => 'Profile';

  @override
  String get welcomeBack => 'Welcome Back ✨';

  @override
  String location(Object city, Object country) {
    return '$city, $country';
  }
}
