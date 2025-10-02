import 'package:evently/ui/auth/login/login_navigator.dart';
import 'package:evently/ui/auth/login/login_screen_view_model.dart';
import 'package:evently/ui/home/tabs/widget/custom_elevated_buttom.dart';
import 'package:evently/ui/home/tabs/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/utils/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  LoginScreenViewModel viewModel = LoginScreenViewModel();
  bool _obscurePassword = true; // إخفاء كلمة المرور بشكل افتراضي

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.logo1, width: 150, height: 150),
                  SizedBox(height: height * 0.02),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email Field
                        CustomTextFormField(
                          hintText: AppLocalizations.of(context)!.email,
                          prefixIcon: Image.asset(AppAssets.iconEmail),
                          controller: viewModel.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text == null || text
                                .trim()
                                .isEmpty) {
                              return 'please enter your email';
                            }
                            final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(viewModel.emailController.text.trim());
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
                          controller: viewModel.passWordController,
                          obscureText: _obscurePassword,
                          obscuringCharacter: '*',
                          validator: (text) {
                            if (text == null || text
                                .trim()
                                .isEmpty) {
                              return 'please enter your password';
                            }
                            if (text.length < 6) {
                              return 'password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: height * 0.02),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // forget password
                              },
                              child: Text(
                                AppLocalizations.of(context)!.forgetPassword,
                                style: AppStyles.bold16Primary.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryLight,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.02),

                        CustomElevatedButton(
                          onPressed: () {
                            viewModel.login();
                          },
                          text: AppLocalizations.of(context)!.login,
                        ),
                        SizedBox(height: height * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.dontHaveAccount,
                                style: AppStyles.bold14Black,
                              ),
                              SizedBox(width: width * 0.02),
                              InkWell(
                                onTap: () {
                                  Navigator.of(
                                    context,
                                  ).pushNamed(AppRoutes.registerRouteName);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.createAccount,
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

                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                indent: width * 0.04,
                                endIndent: width * 0.02,
                                thickness: 2,
                                color: AppColors.primaryLight,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.or,
                              style: AppStyles.medium16Primary,
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.primaryLight,
                                thickness: 2,
                                endIndent: width * 0.04,
                                indent: width * 0.02,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.04),

                        CustomElevatedButton(
                          mainAxisAlignment: MainAxisAlignment.center,
                          onPressed: () {
                            viewModel.login();
                          },
                          icon: true,
                          iconImage: Image.asset(AppAssets.iconGoogal),

                          text: AppLocalizations.of(context)!.loginWithGoogle,
                          textStyle: AppStyles.medium16Primary,
                          backgrounColor: AppColors.transparentColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }


  @override
  void hideMyLoading() {
    DialogUtils.hideLoading(context: context);
  }

  @override
  void showMyLoading(String loadingText) {
    DialogUtils.ShowLoading(context: context, loadingText: loadingText);
  }

  @override
  void showMyMessage(String message) {
    DialogUtils.showMessage(
      context: context, message: message, posActionName: 'OK',
      posAction: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
      },);
  }
}
