import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently/onboarding_screen.dart';

class PersonalizeScreen extends StatelessWidget {
  const PersonalizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final languageProvider = Provider.of<AppLanguageProvider>(context);
    final local = AppLocalizations.of(context)!;

    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/images/logo_top.png', height: 40),
              const SizedBox(height: 20),
              Image.asset('assets/images/intro_header.png', height: height * 0.4),
              const SizedBox(height: 20),
              Text(
                local.personalizeTitle,
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                local.personalizeDesc,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 20),

              // لغة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.language,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryLight, // ✅ لون أبيض
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 60.0,
                    minHeight: 40.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [primaryColor],
                      [primaryColor]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey[200],
                    inactiveFgColor: Colors.black,
                    initialLabelIndex:
                        languageProvider.appLanguage == 'en' ? 0 : 1,
                    totalSwitches: 2,
                    labels: ['🇺🇸', '🇪🇬'],
                    radiusStyle: true,
                    onToggle: (index) {
                      if (index == 0) {
                        languageProvider.ChangeLanguage('en');
                      } else {
                        languageProvider.ChangeLanguage('ar');
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ثيم
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.theme,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryLight // ✅ لون أبيض
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 60.0,
                    minHeight: 40.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [primaryColor],
                      [primaryColor]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey[200],
                    inactiveFgColor: Colors.black,
                    initialLabelIndex:
                        themeProvider.appTheme == ThemeMode.light ? 0 : 1,
                    totalSwitches: 2,
                    icons: [Icons.wb_sunny, Icons.nights_stay],
                    iconSize: 20.0,
                    radiusStyle: true,
                    onToggle: (index) {
                      if (index == 0) {
                        themeProvider.changeTheme(ThemeMode.light);
                      } else {
                        themeProvider.changeTheme(ThemeMode.dark);
                      }
                    },
                  ),
                ],
              ),

              const Spacer(),

              // زر البداية
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                         context,
                          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
                              );
                                       },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    local.letsStart,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
