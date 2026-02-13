import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/resources/Validations.dart';
import 'package:evently_c17/core/resources/dialogue_utilles.dart';
import 'package:evently_c17/core/reusable/CustomButton.dart';
import 'package:evently_c17/core/reusable/CustomField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetpassScreen extends StatefulWidget {
  static const String routeName = "forgetpass";
  const ForgetpassScreen({super.key});

  @override
  State<ForgetpassScreen> createState() => _ForgetpassScreenState();
}

class _ForgetpassScreenState extends State<ForgetpassScreen> {
  late TextEditingController emailController;
  @override
  void initState() {
    // TODO: implement initState
    emailController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(StringsManager.forgetPass.tr()),
        leading: BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AssetsManager.forgetPass),
              SizedBox(height: 8,),
              CustomField(controller: emailController, hint: StringsManager.enterYourEmail.tr(), validator: Validations.validateEmail,prefix: AssetsManager.email,),
              SizedBox(height: 8,),
              Container(
                width: double.infinity,
                child: CustomButton(title: StringsManager.resetPass.tr(), onClick: () async{
                  try{
                    DialogueUtilles.showDialgueLoading(context: context);
                   await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                   Navigator.pop(context);
                  }on FirebaseAuthException catch(e){
                    Navigator.pop(context);
                    if(e.code=='user-not-found'){
                      DialogueUtilles.showDialogueMessage(context: context, message: "no user found");
                    }
                  }
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
