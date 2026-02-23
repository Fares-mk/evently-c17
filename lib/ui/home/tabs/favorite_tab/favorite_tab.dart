import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:evently_c17/core/resources/StringsManager.dart';
import 'package:evently_c17/core/reusable/CustomField.dart';
import 'package:flutter/material.dart';

import '../../../../core/remote/firestore/firestore_manager.dart';
import '../../../../core/reusable/event_item.dart';
import '../../../../model/event.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late TextEditingController searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomField(
                controller:searchController ,
                hint: StringsManager.searchHint.tr(),
                suffix: AssetsManager.search,
                validator: (value) => null ,
            ),
            SizedBox(height: 16,),
            Expanded(
              child: StreamBuilder(stream: FirebaseManager.getUserFavourite(),
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
              )
            ),
          ],
        ),
      ),
    );
  }
  search(){

  }
}
