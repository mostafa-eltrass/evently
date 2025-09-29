// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get language => 'اللغه';

  @override
  String get english => 'الانجليزيه';

  @override
  String get theme => 'النمط';

  @override
  String get dark => 'ليلي';

  @override
  String get light => 'نهاري';

  @override
  String get arabic => 'العربية';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get personalizeTitle => 'خصص تجربتك';

  @override
  String get personalizeDesc =>
      'اختر النمط واللغة المفضلين لديك\nلبدء تجربة مريحة ومخصصة حسب أسلوبك.';

  @override
  String get letsStart => 'لنبدأ';

  @override
  String get onboardTitle1 => 'اعثر على فعاليات تلهمك';

  @override
  String get onboardDesc1 =>
      'انغمس في عالم من الفعاليات المصممة لتناسب اهتماماتك الفريدة. سواء كنت من محبي الموسيقى الحية أو ورش العمل الفنية أو التواصل المهني أو مجرد استكشاف تجارب جديدة، فلدينا ما يناسب الجميع. تساعدك توصياتنا المُختارة على الاستكشاف والتواصل والاستفادة القصوى من كل فرصة من حولك.';

  @override
  String get onboardTitle2 => 'تنظيم فعاليات بكل سهولة';

  @override
  String get onboardDesc2 =>
      'تخلص من عناء تنظيم الفعاليات من خلال أدوات التخطيط الشاملة. من إرسال الدعوات وإدارة التأكيدات إلى تحديد التذكيرات وتنسيق التفاصيل، نحن نهتم بكل شيء. خطط بسهولة وركّز على ما هو مهم - خلق تجربة لا تُنسى لك ولضيوفك.';

  @override
  String get onboardTitle3 => 'تواصل مع الأصدقاء وشارك اللحظات';

  @override
  String get onboardDesc3 =>
      'اجعل كل فعالية لا تُنسى بمشاركتها مع الآخرين. تتيح لك منصتنا دعوة الأصدقاء، وإبقاء الجميع على اطلاع، والاحتفال معًا. التقط اللحظات وشاركها مع شبكتك لتتمكن من استعادة الذكريات وتقدير اللحظات الجميلة.';

  @override
  String get all => 'الكل';

  @override
  String get sport => 'رياضة';

  @override
  String get birthday => 'عيد ميلاد';

  @override
  String get meeting => 'اجتماع';

  @override
  String get gaming => 'ألعاب';

  @override
  String get workshop => 'ورشة';

  @override
  String get bookClub => 'نادي كتاب';

  @override
  String get exhibition => 'معرض';

  @override
  String get holiday => 'عطلة';

  @override
  String get eating => 'أكل';

  @override
  String get home => 'الرئيسية';

  @override
  String get map => 'الخريطة';

  @override
  String get favorite => 'المفضلة';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get welcomeBack => 'مرحبًا بعودتك ✨';

  @override
  String location(Object city, Object country) {
    return '$city، $country';
  }

  @override
  String get searchEvent => 'ابحث عن فعالية';

  @override
  String get name => 'الاسم';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get rePassword => 'تأكيد كلمة المرور';

  @override
  String get forgetPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get createAccount => 'أنشئ حساب';

  @override
  String get or => 'أو';

  @override
  String get loginWithGoogle => 'تسجيل الدخول بواسطة جوجل';

  @override
  String get register => 'تسجيل';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get createEvent => 'إنشاء فعالية';

  @override
  String get title => 'العنوان';

  @override
  String get eventTitle => 'عنوان الفعالية';

  @override
  String get description => 'الوصف';

  @override
  String get eventDescription => 'وصف الفعالية';

  @override
  String get eventDate => 'تاريخ الفعالية';

  @override
  String get chooseDate => 'اختر التاريخ';

  @override
  String get eventTime => 'وقت الفعالية';

  @override
  String get chooseTime => 'اختر الوقت';

  @override
  String get ocation => 'الموقع';

  @override
  String get chooseEventLocation => 'اختر موقع الفعالية';

  @override
  String get addEvent => 'إضافة الفعالية';

  @override
  String get notFoundEvent => 'لا توجد أحداث';
}
