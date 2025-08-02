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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(
    text: 'mostafa@email.com',
  );
  TextEditingController passWordController = TextEditingController(
    text: '123456',
  );
  var formKey = GlobalKey<FormState>();

  bool _obscurePassword = true; // إخفاء كلمة المرور بشكل افتراضي

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                        login();
                      },
                      text: AppLocalizations.of(context)!.login,
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                        // Google login
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
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.ShowLoading(context: context, loadingText: 'Wating....');
      // Proceed to login
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passWordController.text,
            );
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: 'Login sucsessfully',
          title: 'sucsessfully',
          posActionName: 'OK',
          posAction: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteName);
          },
        );
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: 'No user found for that email.',
          title: 'Erorr',
          posActionName: 'OK',
        );

        if (e.code == 'network-request-failed') {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: 'Wrong password provided for that user.',
            title: 'Erorr',
            posActionName: 'OK',
          );
        } else if (e.code == 'invalid-credential') {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: 'uncorrected credential',
            title: 'Erorr',
            posActionName: 'OK',
          );
        }
      } catch (e) {
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          title: 'Erorr',
          posActionName: 'OK',
        );
      }
    }
  }
}
