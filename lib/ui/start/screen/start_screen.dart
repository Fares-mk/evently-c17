import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/ColorsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/reusable/CustomButton.dart';
import 'package:evently_c17/ui/onboarding/screen/onboarding_screen.dart';
import 'package:evently_c17/ui/signin/screen/signin_screen.dart';
import 'package:evently_c17/ui/start/widgets/ThemeSwitch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_porvider.dart';
import '../widgets/LanguageSwitch.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "start";
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ThemePorvider porvider=Provider.of<ThemePorvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsManager.logo,height: 27,fit: BoxFit.fitHeight,color:Theme.of(context).colorScheme.primary),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsManager.beingCreative,color: Theme.of(context).colorScheme.onPrimaryContainer,),
            SizedBox(height: 24,),
            Text(StringsManager.startTitle.tr(),style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 8,),
            Text(StringsManager.startDesc.tr(),style: Theme.of(context).textTheme.bodyMedium,),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringsManager.language.tr(),style: Theme.of(context).textTheme.titleSmall,),
                LanguageSwitch(
                  context.locale.languageCode
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringsManager.theme.tr(),style: Theme.of(context).textTheme.titleSmall,),
                ThemeSwitch(porvider.mode==ThemeMode.dark?"dark":"light")
              ],
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButton(
                  title: StringsManager.letsStart.tr(),
                  onClick: () {
                    Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
                  },),
            )
          ],
        ),
      ) ,
    );
  }
}
