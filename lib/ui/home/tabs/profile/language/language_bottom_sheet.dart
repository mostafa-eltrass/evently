import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:evently/providers/app_language_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.04,
        horizontal: width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              languageProvider.ChangeLanguage('en');
            },
            child: languageProvider.appLanguage =='en'?
            getSelectedLanguageItem(textLanguage:   AppLocalizations.of(context)!.english )
           : getUnSelectedLanguageItem(textLanguage: AppLocalizations.of(context)!.english)
          ),
          SizedBox(height: height * 0.01),
          InkWell(
            onTap: () {
              languageProvider.ChangeLanguage('ar');
            },
            child: languageProvider.appLanguage =='ar'?
            getSelectedLanguageItem(textLanguage: AppLocalizations.of(context)!.arabic):
            getUnSelectedLanguageItem(textLanguage: AppLocalizations.of(context)!.arabic)
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguageItem( {required  String textLanguage}){
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textLanguage
                   ,
                  style: AppStyles.bold20Primary,
                ),
                Icon(Icons.check, color: AppColors.primaryLight, size: 35),
              ],
            );
  }
  Widget getUnSelectedLanguageItem({required  String textLanguage}){
    return Text(
              textLanguage,
              style: AppStyles.bold20Black,
            );
  }
}
