import 'package:evspots/screens/home_screen2.dart';
import 'package:evspots/screens/language_screen.dart';
import 'package:evspots/screens/main_page.dart';
import 'package:evspots/screens/signin_screen.dart';
import 'package:evspots/screens/vehicles.dart';
import 'package:evspots/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'localization/app_model.dart';
import 'themes/theme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        ChangeNotifierProvider<ChangeTime>(create: (_) => ChangeTime()),
        ChangeNotifierProvider<ChangeDropdownValue>(
            create: (_) => ChangeDropdownValue()),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
            return ScopedModelDescendant<AppModel>(
                builder: (context, widget, model) {
              return MaterialApp(
                home: SignInScreen(),
                // themeMode: ThemeMode.system,
                theme: themeNotifier.isDark ? AppTheme.dark : AppTheme.light,

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
