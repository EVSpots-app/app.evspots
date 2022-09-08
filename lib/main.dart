import 'package:evspots/screens/language_screen.dart';
import 'package:evspots/themes/app_theme.dart';
import 'package:evspots/widgets/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'generated/l10n.dart';
import 'localization/app_model.dart';
import 'screens/home_screen.dart';
import 'themes/theme_model.dart';

void main() {
  runApp(ScopedModel<AppModel>(model: AppModel.shared, child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
        ChangeNotifierProvider<ChangeIndex1>(create: (_) => ChangeIndex1()),
        ChangeNotifierProvider<RadioVal>(create: (_) => RadioVal()),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
            return ScopedModelDescendant<AppModel>(
                builder: (context, widget, model) {
              return MaterialApp(
                home: const HomeScreen(),
                // themeMode: ThemeMode.system,

                theme:
                ThemeData(fontFamily: 'Combo',),
                //themeNotifier.isDark ? AppTheme.dark : AppTheme.light,
                debugShowCheckedModeBanner: false,
                locale: AppModel.shared.appLocale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
              );
            });
          },
        ),
      ),
    );
  }
}
