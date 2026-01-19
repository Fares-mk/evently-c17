import 'package:flutter/material.dart';

import '../../../../../core/reusable/event_item.dart';

class BirthdayTab extends StatelessWidget {
  const BirthdayTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => EventItem(),
        separatorBuilder: (context, index) => SizedBox(height: 16,),
        itemCount: 10
    );;
  }
}
