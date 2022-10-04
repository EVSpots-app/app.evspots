import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_model.dart';

class LogoEVSpots extends StatelessWidget {
  const LogoEVSpots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Image.asset(themeNotifier.isDark
          ? 'assets/images/logo_for_dark_theme.png'
          : 'assets/images/logo_for_light_theme.png');
    });
  }
}
