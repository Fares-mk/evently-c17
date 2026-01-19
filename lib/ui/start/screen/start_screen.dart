import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/ColorsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/reusable/CustomButton.dart';
import 'package:evently_c17/ui/signin/screen/signin_screen.dart';
import 'package:evently_c17/ui/start/widgets/ThemeSwitch.dart';
import 'package:flutter/material.dart';

import '../widgets/LanguageSwitch.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "start";
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
            Text(StringsManager.startTitle,style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 8,),
            Text(StringsManager.startDesc,style: Theme.of(context).textTheme.bodyMedium,),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringsManager.language,style: Theme.of(context).textTheme.titleSmall,),
                LanguageSwitch(
                  "ar"
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringsManager.theme,style: Theme.of(context).textTheme.titleSmall,),
                ThemeSwitch("dark")
              ],
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButton(
                  title: StringsManager.letsStart,
                  onClick: () {
                    Navigator.pushReplacementNamed(context, SigninScreen.routeName);
                  },),
            )
          ],
        ),
      ) ,
    );
  }
}
