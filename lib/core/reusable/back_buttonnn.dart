import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/AssetsManager.dart';

class BackButtonnn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(AssetsManager.back,)
    );
  }
}
