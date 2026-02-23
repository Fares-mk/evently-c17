import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  String? prefix;
  void Function() onClick;
  CustomButton({required this.title,required this.onClick,this.prefix});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: prefix==null?Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onPrimaryFixed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        ),
        child: prefix==null?
        Text(title,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white
        ),)
            :Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(prefix!,width: 24,height: 24,),
            Text(title,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onTertiaryFixed
            ),)
          ],
        )
    );
  }
}
