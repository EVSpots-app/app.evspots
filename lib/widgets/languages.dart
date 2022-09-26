import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../localization/app_model.dart';
import 'AppBar.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Consumer<RadioVal>(
      builder: (_, radioVal, __) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            // Text(S.of(context).selectLanguage,
            //     style: const TextStyle(
            //         fontSize: 22, fontWeight: FontWeight.bold)),
            //SizedBox(height: height * 0.03),
            ListTile(
                leading: SizedBox(
                  height: height * 0.1,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('icons/flags/png/2.5x/us.png',
                        package: 'country_icons'),
                  ),
                ),
                trailing: Radio(
                  value: 1,
                  groupValue: radioVal.val,
                  onChanged: (value) {
                    AppModel.shared.changeLanguage('en');
                    radioVal.switchValue(value);

                    // radioVal.switchValue(value);
                  },
                  activeColor: Colors.green,
                ),
                title: const Text("English",
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold))),
            SizedBox(height: height * 0.02),
            ListTile(
              leading: SizedBox(
                height: height * 0.1,
                child: CircleAvatar(
                  backgroundImage: AssetImage('icons/flags/png/2.5x/jo.png',
                      package: 'country_icons'),
                ),
              ),
              trailing: Radio(
                value: 2,
                groupValue: radioVal.val,
                onChanged: (value) {
                  AppModel.shared.changeLanguage('ar');
                  radioVal.switchValue(value);

                  // radioVal.switchValue(value);
                },
                activeColor: Colors.green,
              ),
              title: const Text("عربي",
                  style:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ]),
        );
      },
    );
  }
}

class RadioVal extends ChangeNotifier {
  int val = 1;

  switchValue(value) {
    val = value!;
    notifyListeners();
  }
}
