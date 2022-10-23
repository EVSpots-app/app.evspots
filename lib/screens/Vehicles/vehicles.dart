import 'package:evspots/screens/consumer/settings/consumer_settings.dart';
import 'package:evspots/widgets/AppBar/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes/theme_model.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Consumer<ChangeDropdownValue>(
          builder: (_, changeDropdownValue, __) {
        return Scaffold(
            appBar: MyAppBar(title: 'Vehicles',),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: DropdownButtonFormField(
                icon: const Icon(Icons.arrow_downward),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide( width: 2),
                      ),
                  focusedBorder: OutlineInputBorder(),
                  // filled: true,
                ),
                value: changeDropdownValue.dropdownValue,
                onChanged: (String? newValue) {
                  changeDropdownValue.switchDropdownValue(newValue);
                },
                items: <String>['Bmw', 'Mercedes', 'Tesla', 'Toyota']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ));
      });
    });
  }
}

