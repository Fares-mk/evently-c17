import 'package:evently_c17/core/resources/AssetsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/ColorsManager.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.25,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all( color: ColorsManager.fieldBorder,
        )
      ),
      child: Stack(
        children: [
          Image.asset(AssetsManager.birthday_light),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    color: ColorsManager.fieldBorder,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("21 Jan",style: Theme.of(context).textTheme.titleSmall,),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    color: ColorsManager.fieldBorder,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text("This is a Birthday Party",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                        fontSize: 14
                  )),),
                      SvgPicture.asset(AssetsManager.heart_selected)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
