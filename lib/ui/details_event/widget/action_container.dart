import 'package:evently_c17/model/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ActionContainer extends StatelessWidget {
  String imagePath;
  void Function() onClick;
  ActionContainer({required this.imagePath,required this.onClick});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => onClick(),
      child: Container(
       constraints: BoxConstraints(maxWidth: 40,maxHeight: 40),
        padding:EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondaryFixed,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(imagePath,width: 24,height: 24,fit: BoxFit.contain,),
      ),
    );
  }
}
