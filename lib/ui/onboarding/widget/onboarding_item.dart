import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingItem extends StatelessWidget {
  OnboardingModel onboarding;
  PageController controller = PageController();
  int index=0;

  OnboardingItem({
    required this.onboarding,
    required this.controller,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(onboarding.imagePath,color: Theme.of(context).colorScheme.onPrimaryContainer,)),
          Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: controller,
              effect: WormEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Theme.of(context).colorScheme.tertiary,
                dotWidth: 8,
                dotHeight: 8
              ),
              count: 3,
            ),
          ),
          SizedBox(height: 16,),
          Text(
            onboarding.header.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Text(onboarding.desc.tr(), style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
