import 'package:evently/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:evently/ui/home/tabs/home_tab/home_tab.dart';
import 'package:evently/ui/home/tabs/map/map_tab.dart';
import 'package:evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:evently/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            buildBottomNavigationBarItem(
              label: AppLocalizations.of(context)!.home,
              selectedIconName: AppAssets.iconHomeSelected,
              unselectedIconName: AppAssets.iconHome,
              index: 0,
            ),
            buildBottomNavigationBarItem(
              label: AppLocalizations.of(context)!.map,
              unselectedIconName: AppAssets.iconMap,
              selectedIconName: AppAssets.iconMapSelected,
              index: 1,
            ),
            buildBottomNavigationBarItem(
              label: AppLocalizations.of(context)!.favorite,
              unselectedIconName: AppAssets.iconFavorite,
              selectedIconName: AppAssets.iconFavoriteSelected,
              index: 2,
            ),
            buildBottomNavigationBarItem(
              label: AppLocalizations.of(context)!.profile,
              unselectedIconName: AppAssets.iconProfile,
              index: 3,
              selectedIconName: AppAssets.iconProfileSelected,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String label,
    required String selectedIconName,
    required String unselectedIconName,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          selectedIndex == index ? selectedIconName : unselectedIconName,
        ),
      ),
      label: label,
    );
  }
}
