import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void ShowLoading({
    required BuildContext context,
    required String loadingText,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: AppColors.primaryLight),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(loadingText),
            ),
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
    bool barrierDismissible = true,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName, style: AppStyles.medium16Black),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName, style: AppStyles.medium16Black),
        ),
      );
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message, style: AppStyles.medium16Black),
        title: title != null ? Text(title, style: AppStyles.medium16Black) : null,
        actions: actions,
      ),
    );
  }
}
