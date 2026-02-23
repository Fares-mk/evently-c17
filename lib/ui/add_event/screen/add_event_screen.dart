import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/remote/firestore/firestore_manager.dart';
import 'package:evently_c17/core/resources/AppConstants.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/ColorsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/resources/dialogue_utilles.dart';
import 'package:evently_c17/core/reusable/CustomButton.dart';
import 'package:evently_c17/core/reusable/CustomField.dart';
import 'package:evently_c17/model/event.dart';
import 'package:evently_c17/providers/theme_porvider.dart';
import 'package:evently_c17/ui/home/screen/home_screen.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently_c17/core/reusable/back_buttonnn.dart' as MyBackButton;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/my_flutter_app_icons.dart';
import '../widgets/tab_view_image.dart';

class AddEventScreen extends StatefulWidget {
  static const String routeName = "add_event";

  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late TextEditingController titleController;
  late TextEditingController descController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int selectedindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemePorvider porvider=Provider.of<ThemePorvider>(context);
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.addEvent.tr()),
        leading: MyBackButton.BackButtonnn(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: DefaultTabController(
            length: 5,
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.25,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TabViewImage(porvider.mode==ThemeMode.light?AssetsManager.sport_light:AssetsManager.sport_dark),
                        TabViewImage(porvider.mode==ThemeMode.light?AssetsManager.birthday_light:AssetsManager.birthday_dark),
                        TabViewImage(porvider.mode==ThemeMode.light?AssetsManager.book_light:AssetsManager.book_dark),
                        TabViewImage(porvider.mode==ThemeMode.light?AssetsManager.exhibition_light:AssetsManager.exhibition_dark),
                        TabViewImage(porvider.mode==ThemeMode.light?AssetsManager.meeting_light:AssetsManager.meeting_dark),
                      ],
                    ),
                  ),
                  TabBar(
                    onTap: (value) {
                      setState(() {
                        selectedindex = value;
                      });
                    },
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.white,
                    unselectedLabelColor: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                    tabs: [
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
                  SizedBox(height: 16),
                  Text(
                    StringsManager.title.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomField(
                    controller: titleController,
                    hint: StringsManager.eventTitle.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    StringsManager.desc.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomField(
                    controller: descController,
                    hint: StringsManager.eventDesc.tr(),
                    maxLines: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.date,
                        colorFilter: ColorFilter.mode(
                          Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        StringsManager.eventDate.tr(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          chooseDate();
                        },
                        child: Text(selectedDate != null ?
                        DateFormat.yMd().format(selectedDate!) : StringsManager
                            .chooseDate.tr(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.time,
                        colorFilter: ColorFilter.mode(
                          Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        StringsManager.eventTime.tr(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          chooseTime();
                        },
                        child: Text(
                          selectedTime != null
                              ? "${selectedTime!.hourOfPeriod}:${selectedTime!
                              .minute}${selectedTime!.period.name}"
                              : StringsManager.chooseTime.tr(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: StringsManager.addEvent.tr(),
                      onClick: () {
                        addEvent();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addEvent() async {
    if (formkey.currentState!.validate()) {
      DateTime newdate =DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day,
          selectedTime!.hour, selectedTime!.minute);
      DialogueUtilles.showDialgueLoading(context: context);
      await FirebaseManager.addEvent(
        Event(
          title: titleController.text,
          description: descController.text,
          userId: FirebaseAuth.instance.currentUser!.uid,
          type: AppConstants.type[selectedindex],
          eventDate: Timestamp.fromDate(newdate),
        ),
      );
      Navigator.pop(context);
      DialogueUtilles.showDialogueMessage(
        context: context,
        message: "Event add successfully",
      );
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }

  DateTime? selectedDate;

  chooseDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 356)),
    );
    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  TimeOfDay? selectedTime;

  chooseTime() async {
    TimeOfDay? newTime = await showTimePicker(
        context: context, initialTime: selectedTime ?? TimeOfDay.now());
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }
}
