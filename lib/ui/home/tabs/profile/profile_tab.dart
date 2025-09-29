import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';

import 'package:evently/ui/home/tabs/profile/language/language_bottom_sheet.dart';
import 'package:evently/ui/home/tabs/profile/theme/theme_bottom_sheet.dart';
import 'package:evently/ui/home/tabs/widget/custom_elevated_buttom.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryLight,
      toolbarHeight: height*0.20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          bottomLeft: Radius.circular(45)
        )
      ),
      title: Row(
        children: [
          Container(
            height: height*0.15,
            child: Image.asset(AppAssets.routeImage,
            
            
            ),
          ),
          SizedBox(width: width*0.1,),
          Column(
            children: [
              Text('Mostafa ',
          style: AppStyles.bold24White,
          ),
           SizedBox(height: height*0.02,),
          Text('mostafa@gmail.com', 
          style: AppStyles.bold14White,
          ),
            ],
          )
          
        ],
      ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.04,
          horizontal: width * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.02),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryLight, width: 2),
              ),

              child: InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: AppStyles.bold20Primary,
                    ),
                    Icon(Icons.arrow_drop_down_outlined, size: 35),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.02),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryLight, width: 2),
              ),

              child: InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( themeProvider.isDarkMode()?
                    AppLocalizations.of(context)!.dark: 
                    AppLocalizations.of(context)!.light
                    , style: AppStyles.bold20Primary),
                    Icon(Icons.arrow_drop_down_outlined, size: 35),
                  ],
                ),
              ),
            ),
         Spacer(),
          CustomElevatedButton(
            backgrounColor: AppColors.redColor,
            borderColor: AppColors.redColor,
            onPressed:  (){

          }, 
          icon: true,
          
          iconImage: Padding(
            padding:   EdgeInsets.symmetric(horizontal: width*0.02),
            child: Icon(Icons.logout, color: AppColors.whiteColor,size: 30,),
          ),
          text:  AppLocalizations.of(context)!.logout,
               
                )
          ],
        ),
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
/*
 ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16)
            ),
            padding: EdgeInsets.symmetric(
              vertical: height*0.02,
              horizontal: width*0.04
            )
          ),
           
          onPressed: ( ){},
          child:  Row(
            children: [
              Icon(Icons.logout, color: AppColors.whiteColor,size: 30,),
               SizedBox(width: width*0.04,),
              Text(AppLocalizations.of(context)!.logout,
              style: AppStyles.bold20White,
              )
            ],
          )
         )
*/