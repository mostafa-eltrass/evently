import 'package:evently/ui/home/tabs/widget/custom_elevated_buttom.dart';
import 'package:evently/ui/home/tabs/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController(text: 'mostafa@email.com');
  TextEditingController nameController = TextEditingController(text: 'mostafa');
  TextEditingController passWordController = TextEditingController(text: '123456');
  TextEditingController repassWordController = TextEditingController(text: '123456');
  var formKey = GlobalKey<FormState>();

  bool _obscurePassword = true; // إخفاء كلمة المرور بشكل افتراضي

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.whiteBgColor,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyles.bold16Black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo1, width: 150, height: 150),
              SizedBox(height: height * 0.02),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email Field
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.name,
                      prefixIcon: Image.asset(AppAssets.iconName),
                      controller: nameController,

                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your name';
                        }
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: Image.asset(AppAssets.iconEmail),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your email';
                        }
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(emailController.text.trim());
                        if (!emailValid) {
                          return 'please enter a valid email';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: height * 0.02),

                    // Password Field with toggle
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.password,
                      prefixIcon: Image.asset(AppAssets.iconPassword),
                      suiffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Image.asset(
                          _obscurePassword
                              ? AppAssets.iconShowPassword
                              : AppAssets.iconShowPassword,
                        ),
                      ),
                      controller: passWordController,
                      obscureText: _obscurePassword,
                      obscuringCharacter: '*',
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your password';
                        }
                        if (text.length < 6) {
                          return 'password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.rePassword,
                      prefixIcon: Image.asset(AppAssets.iconPassword),
                      suiffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Image.asset(
                          _obscurePassword
                              ? AppAssets.iconShowPassword
                              : AppAssets.iconShowPassword,
                        ),
                      ),
                      controller: repassWordController,
                      obscureText: _obscurePassword,
                      obscuringCharacter: '*',
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your re- password';
                        }
                        if (text.length < 6) {
                          return 'password must be at least 6 characters';
                        }
                        if (passWordController.text != text) {
                          return 're-password does not match password';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: height * 0.02),

                    SizedBox(height: height * 0.02),

                    CustomElevatedButton(
                      onPressed: () {
                        register();
                        
                      },
                      text: AppLocalizations.of(context)!.createAccount,
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.alreadyHaveAccount,
                            style: AppStyles.bold14Black,
                          ),
                          SizedBox(width: width * 0.02),
                          InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.loginRouteName);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: AppStyles.medium16Primary.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.04),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      // Proceed to register
      print("Logging in...");
      Navigator.of(context
    ).pushReplacementNamed(AppRoutes.homeRouteName);
    }
  }
}
