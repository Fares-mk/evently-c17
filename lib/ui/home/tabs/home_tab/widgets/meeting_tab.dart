import 'package:flutter/material.dart';

import '../../../../../core/remote/firestore/firestore_manager.dart';
import '../../../../../core/reusable/event_item.dart';
import '../../../../../model/event.dart';

class MeetingTab extends StatelessWidget {
  const MeetingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseManager.getTypeEvent("Meeting"),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError){
          return InkWell(
              onTap: () => FirebaseManager.getEvent(),
              child: Center(child: Text("Try again")));
        }
        List<Event> eventList=snapshot.data??[];
        return ListView.separated(
            itemBuilder: (context, index) => EventItem(event: eventList[index] ),
            separatorBuilder: (context, index) => SizedBox(height: 16,),
            itemCount: eventList.length
        );
      },
    );
  }
}
