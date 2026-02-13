import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/model/onboarding_model.dart';

class OnboardingList {
  static List<OnboardingModel> onboarding = [
    OnboardingModel(
      imagePath: AssetsManager.cat,
      header: StringsManager.catHeader,
      desc: StringsManager.catDesc,
    ),
    OnboardingModel(
      imagePath: AssetsManager.teacher,
      header: StringsManager.teacherHeader,
      desc: StringsManager.teacherDesc,
    ),
    OnboardingModel(
      imagePath: AssetsManager.social,
      header: StringsManager.socialHeader,
      desc: StringsManager.socialDesc,
    ),
  ];
}
