import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/remote/firestore/firestore_manager.dart';
import 'package:evently_c17/core/resources/dialogue_utilles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently_c17/model/user.dart' as Myuser;
import '../../../core/resources/AssetsManager.dart';
import '../../../core/resources/StringsManager.dart';
import '../../../core/resources/Validations.dart';
import '../../../core/reusable/CustomButton.dart';
import '../../../core/reusable/CustomField.dart';
import '../../signin/screen/signin_screen.dart';
import 'package:evently_c17/ui/home/screen/home_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "signup";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Image.asset(
            AssetsManager.logo, height: 27, fit: BoxFit.fitHeight, color: Theme
            .of(context)
            .colorScheme
            .primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringsManager.createYourAcc.tr(), style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 24,),
                CustomField(
                    controller: nameController,
                    hint: StringsManager.enterYourName.tr(),
                    prefix: AssetsManager.profile,
                    validator: Validations.validateName
                ),
                SizedBox(height: 16,),
                CustomField(
                  controller: emailController,
                  hint: StringsManager.enterYourEmail.tr(),
                  prefix: AssetsManager.email,
                  validator: Validations.validateEmail,
                ),
                SizedBox(height: 16,),
                CustomField(
                  controller: passwordController,
                  hint: StringsManager.enterYourPassword.tr(),
                  prefix: AssetsManager.lock,
                  isPassword: true,

                  validator: Validations.validatePassword,
                ),
                SizedBox(height: 16,),
                CustomField(
                  controller: confirmPasswordController,
                  hint: StringsManager.confirmYourPassword.tr(),
                  prefix: AssetsManager.lock,
                  isPassword: true,
                  validator: (value) {
                    return Validations.validateConfirmPass(
                        value, passwordController.text);
                  },
                ),
                SizedBox(height: 48,),
                Container(
                  width: double.infinity,
                  child: CustomButton(
                      title: StringsManager.signUp.tr(), onClick: () {
                    signup();
                  }),
                ),
                SizedBox(height: 48,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringsManager.alreadyHaveAccount.tr(), style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SigninScreen.routeName);
                        }, child: Text(StringsManager.login.tr(), style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall,))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signup() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        DialogueUtilles.showDialgueLoading(context: context);
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        FirebaseManager.addUser(uid: credential.user!.uid,
            user: Myuser.User(id: credential.user!.uid,
                name: nameController.text,
                email: emailController.text));
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, SigninScreen.routeName);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'weak-password') {
          DialogueUtilles.showDialogueMessage(
              context: context, message: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          DialogueUtilles.showDialogueMessage(context: context,
              message: 'The account already exists for that email.');
        }
      } catch (e) {
        Navigator.pop(context);
        DialogueUtilles.showDialogueMessage(
            context: context, message: e.toString());
      }
    }
  }
}
