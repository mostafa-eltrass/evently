import 'package:flutter/material.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:evently/ui/utils/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context)!;

    final onboardingData = [
      {
        'image': 'assets/images/intro_header.png',
        'title': local.onboardTitle1,
        'desc': local.onboardDesc1,
      },
      {
        'image': 'assets/images/manager-desk.png',
        'title': local.onboardTitle2,
        'desc': local.onboardDesc2,
      },
      {
        'image': 'assets/images/being-creative.png',
        'title': local.onboardTitle3,
        'desc': local.onboardDesc3,
      },
    ];

    void goNext() {
      if (currentIndex < onboardingData.length - 1) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    }

    void goBack() {
      if (currentIndex > 0) {
        _controller.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                final item = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Image.asset(
                        item['image']!,
                        height: size.height * 0.4,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        item['title']!,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item['desc']!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ✅ المؤشرات
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingData.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? theme.colorScheme.primary
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),

          const SizedBox(height: 24),

          // ✅ السهمين
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // زر الرجوع
                IconButton(
                  onPressed: currentIndex == 0 ? null : goBack,
                  icon: const Icon(Icons.arrow_back_ios),
                  color: currentIndex == 0
                      ? Colors.grey
                      : theme.colorScheme.primary,
                ),

                // زر التالي أو "تم"
                IconButton(
                  onPressed: goNext,
                  icon: Icon(
                    currentIndex == onboardingData.length - 1
                        ? Icons.check
                        : Icons.arrow_forward_ios,
                  ),
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
