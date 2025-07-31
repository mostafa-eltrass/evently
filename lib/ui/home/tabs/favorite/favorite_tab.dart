import 'package:evently/ui/home/tabs/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_item.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
class FavoriteTab extends StatelessWidget {
    FavoriteTab({super.key});
     TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height*0.02,),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal:width*0.04 ),
            child: CustomTextFormField(colorBorderSide: AppColors.primaryLight,
            hintText: AppLocalizations.of(context)!.searchEvent,
            hintStyle: AppStyles.bold14Primary,
            prefixIcon: Image.asset(AppAssets.iconSearch),
            controller: searchController,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.02),
              itemBuilder: (context, index) {
                return Container();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
