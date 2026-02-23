import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/remote/firestore/firestore_manager.dart';
import 'package:evently_c17/core/resources/AppConstants.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/model/event.dart';
import 'package:evently_c17/providers/theme_porvider.dart';
import 'package:evently_c17/providers/user_provider.dart';
import 'package:evently_c17/ui/details_event/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../ui/edit_event/screen/edit_event.dart';

class EventItem extends StatefulWidget {
  Event event;

  EventItem({required this.event});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    ThemePorvider themePorvider = Provider.of<ThemePorvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, DetailsScreen.routeName, arguments: widget.event),
      child: Container(
        height: height * 0.25,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Stack(
          children: [
            Image.asset(
              themePorvider.mode == ThemeMode.dark
                  ? AppConstants.eventdark[widget.event.type] ?? ""
                  : AppConstants.event[widget.event.type] ?? "",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      DateFormat.MMMd().format(
                        widget.event.eventDate!.toDate(),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.event.description ?? '',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (userProvider.user?.favourite?.contains(
                                    widget.event.id,
                                  ) ??
                                  false) {
                                FirebaseManager.deleteFavouriteEvent(
                                  widget.event,
                                );
                                userProvider.user?.favourite?.remove(
                                  widget.event.id,
                                );
                                FirebaseManager.updateFavouriteEvent(
                                  userProvider.user?.favourite ?? [],
                                );
                              } else {
                                FirebaseManager.addFavouriteEvent(widget.event);
                                userProvider.user?.favourite?.add(
                                  widget.event.id ?? "",
                                );
                                FirebaseManager.updateFavouriteEvent(
                                  userProvider.user?.favourite ?? [],
                                );
                              }
                            });
                          },
                          icon:
                              userProvider.user?.favourite?.contains(
                                    widget.event.id,
                                  ) ??
                                  false
                              ? SvgPicture.asset(AssetsManager.heart_selected)
                              : SvgPicture.asset(AssetsManager.heart),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
