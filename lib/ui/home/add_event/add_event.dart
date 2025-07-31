import 'package:evently/firebase_utils.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/ui/home/add_event/widget/custom_date_or_time_widget.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_tab_item.dart';
import 'package:evently/ui/home/tabs/widget/custom_elevated_buttom.dart';
import 'package:evently/ui/home/tabs/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  var formKey = GlobalKey<FormState>();
  String? formatedTime;
  String selectedImage = '';
  String selectedEventName = '';
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  late EventListProvider
  eventListProvider; // كدا انا خليته جلوبال عشان استخدمه بري البيلد
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventListProvider = Provider.of<EventListProvider>(context);
    List<String> eventsNameList = [
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
    List<String> eventImageList = [
      AppAssets.sportImage,
      AppAssets.birthdayImage,
      AppAssets.meetingImage,
      AppAssets.gamingImage,
      AppAssets.workshopImage,
      AppAssets.bookClubImage,
      AppAssets.exhibitionImage,
      AppAssets.holidayImage,
      AppAssets.eatingImage,
    ];
    selectedImage = eventImageList[selectedIndex];
    selectedEventName = eventsNameList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        title: Text(
          AppLocalizations.of(context)!.createEvent,
          style: AppStyles.medium16Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias, //  ده عشان يعمله رديز من الجناب
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(eventImageList[selectedIndex]),
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  height: height * 0.05,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: EventTabItem(
                          unSelectedTextStyle: Theme.of(
                            context,
                          ).textTheme.headlineMedium!,
                          selectedTextStyle: Theme.of(
                            context,
                          ).textTheme.headlineSmall!,
                          selectedBgColor: AppColors.primaryLight,
                          borderColor: AppColors.primaryLight,
                          isSelected: selectedIndex == index,
                          eventName: eventsNameList[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width * 0.02);
                    },
                    itemCount: eventsNameList.length,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: height * 0.01),
                CustomTextFormField(
                  hintStyle: themeProvider.isDarkMode()
                      ? AppStyles.medium16White
                      : AppStyles.medium16Black,
                  colorBorderSide: themeProvider.isDarkMode()
                      ? AppColors.primaryLight
                      : AppColors.greyColor,
                  controller: titleController,
                  hintText: AppLocalizations.of(context)!.eventTitle,
                  prefixIcon: Image.asset(
                    AppAssets.iconEdit,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  hintStyle: themeProvider.isDarkMode()
                      ? AppStyles.medium16White
                      : AppStyles.medium16Black,
                  colorBorderSide: themeProvider.isDarkMode()
                      ? AppColors.primaryLight
                      : AppColors.greyColor,
                  controller: descriptionController,
                  hintText: AppLocalizations.of(context)!.eventDescription,
                  maxLines: 3,
                ),
                SizedBox(height: height * 0.02),
                CustomDateOrTimeWidget(
                  iconColor: Theme.of(context).dividerColor,
                  onChooseDateOrTimeClicked: chooseDate,
                  chooseDateOrTime: selectedDate == null
                      ? AppLocalizations.of(context)!.chooseDate
                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',

                  iconDateOrTimeName: AppAssets.iconDate,
                  eventDateOrTime: AppLocalizations.of(context)!.eventDate,
                ),
                CustomDateOrTimeWidget(
                  iconColor: Theme.of(context).dividerColor,
                  onChooseDateOrTimeClicked: chooseTime,
                  chooseDateOrTime: selectedTime == null
                      ? AppLocalizations.of(context)!.chooseTime
                      : formatedTime!,
                  iconDateOrTimeName: AppAssets.iconTime,
                  eventDateOrTime: AppLocalizations.of(context)!.eventTime,
                ),

                Text(
                  AppLocalizations.of(context)!.ocation,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: height * 0.01),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: width * 0.001,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryLight, width: 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.02,
                          horizontal: width * 0.03,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryLight,
                        ),
                        child: Image.asset(AppAssets.iconLocation),
                      ),
                      Text(
                        AppLocalizations.of(context)!.chooseEventLocation,
                        style: AppStyles.medium16Primary,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.primaryLight,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: () {
                      addEvent();
                    },
                    text: AppLocalizations.of(context)!.addEvent,
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      Event event = Event(
        image: selectedImage,
        dateTime: selectedDate!,
        description: descriptionController.text,
        eventName: selectedEventName,
        time: formatedTime!,
        title: titleController.text,
      );
      FirebaseUtils.addEventToFirebase(
        event,
      ).timeout(Duration(milliseconds: 500), onTimeout: () {});
      ToastUtils.toastMsg(
        msg: 'add Event Sucessfully',
        backgroundColor: AppColors.primaryLight,
        textColor: AppColors.whiteColor,
      );
      eventListProvider.getAllEvents(); // عشان يظهر التحديث علي طول لو اديته ايفنت 
    }
  }

  void chooseDate() async {
    var chosseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    selectedDate = chosseDate;

    setState(() {});
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    selectedTime = chooseTime;
    if (selectedTime != null) {
      formatedTime = selectedTime!.format(context);
      setState(() {});
    }
  }
}
