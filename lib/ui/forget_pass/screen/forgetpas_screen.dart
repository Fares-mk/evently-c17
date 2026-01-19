import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/reusable/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetpassScreen extends StatelessWidget {
  static const String routeName = "forgetpass";
  const ForgetpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.forgetPass),
        leading: BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(AssetsManager.forgetPass),
            Container(
              width: double.infinity,
              child: CustomButton(title: StringsManager.resetPass, onClick: () {
        
              },),
            )
          ],
        ),
      ),
    );
  }
}
