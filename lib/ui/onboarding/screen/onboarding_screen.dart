import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/reusable/back_buttonnn.dart';
import 'package:evently_c17/model/onboarding_list.dart';
import 'package:evently_c17/ui/onboarding/widget/onboarding_item.dart';
import 'package:evently_c17/ui/signin/screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/reusable/CustomButton.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        actionsPadding: EdgeInsets.all(16),
        leading: index == 0
            ? null
            : IconButton(
                onPressed: () {
                  controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: SvgPicture.asset(
                  AssetsManager.back,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.dstIn,
                  ),
                ),
              ),
        title: Image.asset(
          AssetsManager.logo,
          height: 24,
          fit: BoxFit.fitHeight,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).pushReplacementNamed(SigninScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.all(5.5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                return OnboardingItem(
                  onboarding: OnboardingList.onboarding[index],
                  controller: controller,
                  index: index,
                );
              },
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              itemCount: OnboardingList.onboarding.length,
              controller: controller,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 14, right: 14),
            width: double.infinity,
            child: CustomButton(
              title: index != 2
                  ? StringsManager.next.tr()
                  : StringsManager.getStarted.tr(),
              onClick: () {
                index == 2
                    ? Navigator.of(
                        context,
                      ).pushReplacementNamed(SigninScreen.routeName)
                    : controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
              },
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
