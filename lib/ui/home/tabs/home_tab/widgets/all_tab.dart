import 'package:evently_c17/core/remote/firestore/firestore_manager.dart';
import 'package:evently_c17/core/reusable/event_item.dart';
import 'package:evently_c17/model/event.dart';
import 'package:flutter/material.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseManager.getEventRealtime(),
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
