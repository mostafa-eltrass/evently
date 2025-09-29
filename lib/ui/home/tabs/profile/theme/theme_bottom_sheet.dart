import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isDark = themeProvider.isDarkMode();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),

          // Light Mode
          ListTile(
            leading: Icon(Icons.light_mode,
                color: !isDark ? AppColors.primaryLight : Colors.grey),
            title: Text(AppLocalizations.of(context)!.light),
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
          ),

          // Dark Mode
          ListTile(
            leading: Icon(Icons.dark_mode,
                color: isDark ? AppColors.primaryLight : Colors.grey),
            title: Text(AppLocalizations.of(context)!.dark),
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
