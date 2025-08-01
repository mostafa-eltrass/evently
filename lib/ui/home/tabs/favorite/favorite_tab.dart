import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/ui/home/tabs/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_item.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 📌 تحميل بيانات المفضلة مرة واحدة بعد فتح الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<EventListProvider>(context, listen: false);
      provider.getAllFavoriteEventList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<EventListProvider>(context);

    // 📌 طباعة الأحداث المفضلة لتتبع البيانات
    print("❤️ Favorite Events Count: ${provider.favoriteEventList.length}");
    for (var e in provider.favoriteEventList) {
      print("📌 UI Event: ${e.title} | isFavorite: ${e.isFavorite}");
    }

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: CustomTextFormField(
              colorBorderSide: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.searchEvent,
              hintStyle: AppStyles.bold14Primary,
              prefixIcon: Image.asset(AppAssets.iconSearch),
              controller: searchController,
            ),
          ),
          Expanded(
            child: provider.favoriteEventList.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.notFoundEvent,
                      style: AppStyles.bold16Primary,
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(top: height * 0.02),
                    itemBuilder: (context, index) {
                      final event = provider.favoriteEventList[index];
                      return EventItem(event: event);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.02);
                    },
                    itemCount: provider.favoriteEventList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
