import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:evently/ui/home/add_event/widget/custom_date_or_time_widget.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_tab_item.dart';
import 'package:evently/ui/home/tabs/widget/custom_elevated_buttom.dart';
import 'package:evently/ui/home/tabs/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteBgColor,
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        title: Text(
          AppLocalizations.of(context)!.createEvent,
          style: AppStyles.medium16Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
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
                style: AppStyles.bold16Black,
              ),
              SizedBox(height: height * 0.01),
              CustomTextFormField(
                controller: titleController,
                hintText: AppLocalizations.of(context)!.eventTitle,
                prefixIcon: Image.asset(AppAssets.iconEdit),
              ),
              SizedBox(height: height * 0.02),
              Text(
                AppLocalizations.of(context)!.description,
                style: AppStyles.bold16Black,
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: descriptionController,
                hintText: AppLocalizations.of(context)!.eventDescription,
                maxLines: 3,
              ),
              SizedBox(height: height * 0.02),
              CustomDateOrTimeWidget(
                onChooseDateOrTimeClicked: chooseDate,
                chooseDateOrTime: AppLocalizations.of(context)!.chooseDate,
                iconDateOrTimeName: AppAssets.iconDate,
                eventDateOrTime: AppLocalizations.of(context)!.eventDate,
              ),
              CustomDateOrTimeWidget(
                onChooseDateOrTimeClicked: chooseTime,
                chooseDateOrTime: AppLocalizations.of(context)!.chooseTime,
                iconDateOrTimeName: AppAssets.iconTime,
                eventDateOrTime: AppLocalizations.of(context)!.eventTime,
              ),

              Text(
                AppLocalizations.of(context)!.ocation,
                style: AppStyles.bold16Black,
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
    );
  }

  void chooseDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
  }

  void chooseTime() {
    showTimePicker(
      context: context, 
      initialTime: )
  }
  void addEvent() {}
}
