import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/resources/AppConstants.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/resources/Validations.dart';
import 'package:evently_c17/core/reusable/CustomButton.dart';
import 'package:evently_c17/core/reusable/CustomField.dart';
import 'package:evently_c17/ui/forget_pass/screen/forgetpas_screen.dart';
import 'package:evently_c17/ui/home/screen/home_screen.dart';
import 'package:evently_c17/ui/signup/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/AssetsManager.dart';
import '../../../core/resources/dialogue_utilles.dart';

class SigninScreen extends StatefulWidget {
  static const String routeName = "signin";

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Image.asset(
          AssetsManager.logo,
          height: 27,
          fit: BoxFit.fitHeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsManager.loginToYourAcc.tr(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),
                CustomField(
                  controller: emailController,
                  hint: StringsManager.enterYourEmail.tr(),
                  prefix: AssetsManager.email,
                  validator: Validations.validateEmail,
                ),
                SizedBox(height: 16),
                CustomField(
                  controller: passwordController,
                  hint: StringsManager.enterYourPassword.tr(),
                  prefix: AssetsManager.lock,
                  isPassword: true,
        
                  validator: Validations.validatePassword,
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgetpassScreen.routeName);
                    },
                    child: Text(
                      StringsManager.forgetPassAsk.tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                SizedBox(height: 48),
                Container(
                  width: double.infinity,
                  child: CustomButton(
                    title: StringsManager.login.tr(),
                    onClick: () {
                      login();
                    },
                  ),
                ),
                SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.dontHaveAcc.tr(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          SignupScreen.routeName,
                        );
                      },
                      child: Text(
                        StringsManager.signUp.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32,),
                Center(child: Text("or",style: Theme.of(context).textTheme.labelMedium,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async{
    if(formKey.currentState?.validate()??false){
      try {
        DialogueUtilles.showDialgueLoading(context: context);
        UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'user-not-found') {
          DialogueUtilles.showDialogueMessage(context: context, message: 'No user found for that email.');
          print(e.code);
        } else if (e.code == 'wrong-password') {
          DialogueUtilles.showDialogueMessage(context: context, message:'Wrong password provided for that user.');
          print(e.code);
        }
      } catch (e) {
        Navigator.pop(context);
        DialogueUtilles.showDialogueMessage(context: context, message: e.toString());
      }
    }
  }
}
