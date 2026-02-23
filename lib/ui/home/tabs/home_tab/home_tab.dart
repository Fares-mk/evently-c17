import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/providers/user_provider.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/widgets/all_tab.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/widgets/birthday_tab.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/widgets/book_tab.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/widgets/exhibition_tab.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/widgets/meeting_tab.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/widgets/sport_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/my_flutter_app_icons.dart';

class HomeTab extends StatelessWidget {
  static const String routeName="home";
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsManager.welcomeBack.tr(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        userProvider.user?.name != null
                            ? Text(
                                userProvider.user?.name ?? "",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              )
                            : CircularProgressIndicator(),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.sun,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "EN",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              TabBar(
                dividerHeight: 0,
                tabAlignment: TabAlignment.start,
                labelColor: Colors.white,
                unselectedLabelColor: Theme.of(context).colorScheme.primary,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).primaryColor,
                ),
                tabs: [
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.all),
                          SizedBox(width: 4),
                          Text(StringsManager.all.tr()),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.bike),
                          SizedBox(width: 4),
                          Text(StringsManager.sport.tr()),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.birthday_icon),
                          SizedBox(width: 4),
                          Text(StringsManager.birthday.tr()),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.book),
                          SizedBox(width: 4),
                          Text(StringsManager.bookClub.tr()),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.exhibition),
                          SizedBox(width: 4),
                          Text(StringsManager.exhibition.tr()),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.meeting),
                          SizedBox(width: 4),
                          Text(StringsManager.meeting.tr()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: TabBarView(
                  children: [
                    AllTab(),
                    SportTab(),
                    BirthdayTab(),
                    BookTab(),
                    ExhibitionTab(),
                    MeetingTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
