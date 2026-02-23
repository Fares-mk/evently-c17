import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/remote/firestore/firestore_manager.dart';
import 'package:evently_c17/core/resources/AppConstants.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/resources/dialogue_utilles.dart';
import 'package:evently_c17/core/reusable/back_buttonnn.dart';
import 'package:evently_c17/model/event.dart';
import 'package:evently_c17/providers/theme_porvider.dart';
import 'package:evently_c17/ui/details_event/widget/action_container.dart';
import 'package:evently_c17/ui/edit_event/screen/edit_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details";

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
   ThemePorvider themePorvider =Provider.of<ThemePorvider>(context);
   Event event= ModalRoute.of(context)?.settings.arguments as Event;
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonnn(),
        title: Text(StringsManager.Eventdetails.tr()),
        actionsPadding: EdgeInsets.all(16),
        actions: [
          ActionContainer(imagePath: AssetsManager.edit,onClick: () {
            Navigator.pushNamed(context, EditEvent.routeName,arguments: event);
          },),
          SizedBox(width: 8),
          ActionContainer(imagePath: AssetsManager.delete,onClick: () => deleteEvent(event),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Image.asset(themePorvider.mode==ThemeMode.light?AppConstants.event[event.type]??"":AppConstants.eventdark[event.type]??""),
            Text(event.title??""),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryFixed,
                border: BoxBorder.all(color: Theme.of(context).colorScheme.onTertiaryContainer),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Row(
                spacing: 16,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(color: Theme.of(context).colorScheme.onTertiaryContainer),
                      color: Theme.of(context).colorScheme.onSecondary
                    ),
                    child:
                    SvgPicture.asset(AssetsManager.date),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(DateFormat.MMMd().format(event.eventDate?.toDate()??DateTime.now()),style:Theme.of(context).textTheme.displayMedium),
                      Text(DateFormat.jm().format(event.eventDate?.toDate()??DateTime.now()),style:Theme.of(context).textTheme.displaySmall)
                    ],
                  )
                ],
              ),
            ),
            Text("Description"),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryFixed,
                  border: BoxBorder.all(color: Theme.of(context).colorScheme.onTertiaryContainer),
                  borderRadius: BorderRadius.circular(16)
              ),
              child:Text(event.description??""),
            )
          ],
        ),
      ),
    );

  }

  deleteEvent(Event event)async{
  DialogueUtilles.showDialgueLoading(context: context);
    await FirebaseManager.deleteEvent(event);
    Navigator.pop(context);
   Navigator.pop(context);
  }
}

