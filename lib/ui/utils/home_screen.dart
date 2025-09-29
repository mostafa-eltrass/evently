import 'package:evently/utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
       
      body: ProfileTab());
  }
}
