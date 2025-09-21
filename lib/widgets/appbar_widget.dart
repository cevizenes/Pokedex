import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';

class AppBarWidget extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String pokemonLogoPath = 'assets/images/pokeball.png';
    String title = 'Pokedex';
    return SizedBox(
      height: UIHelper.getAppBarHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(title, style: UIHelper.getTitleTextStyle()),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokemonLogoPath,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
