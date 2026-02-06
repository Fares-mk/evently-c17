import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/ColorsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/ui/home/tabs/profile_tab/widgets/settings_item.dart';
import 'package:evently_c17/ui/signin/screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 58,
              backgroundImage: AssetImage(AssetsManager.route),
            ),
            SizedBox(height: 16,),
            Text("John Safwat",style: Theme.of(context).textTheme.titleMedium,),
            Text("johnsafwat.route@gmail.com",style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 32,),
            SettingsItem(
                title: StringsManager.darkMode.tr(),
                action: CupertinoSwitch(
                    value: false,
                    activeTrackColor: Theme.of(context).colorScheme.primary,
                    onChanged: (value) {

                    },
                )
            ),
            SizedBox(height: 16,),
            SettingsItem(
                onTap: () {

                },
                title: StringsManager.language.tr(),
                action: SvgPicture.asset(AssetsManager.arrowRight)
            ),
            SizedBox(height: 16,),
            SettingsItem(
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed(SigninScreen.routeName);
              },
                title: StringsManager.logout.tr(),
                action: SvgPicture.asset(AssetsManager.logout)
            ),
          ],
        ),
      ),
    );
  }
}
