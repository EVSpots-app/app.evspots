import 'package:evspots/screens/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../generated/l10n.dart';
import '../screens/home_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
               UserAccountsDrawerHeader(
                accountName: Text(S.of(context).motasemAltamimi),
                accountEmail: Text("Motasem.sh@gmail.com"),
                currentAccountPicture: Picture(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/n2.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                otherAccountsPictures: [
                  // const CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: NetworkImage(
                  //       "https://randomuser.me/api/portraits/women/74.jpg"),
                  // ),
                  // const CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: NetworkImage(
                  //       "https://randomuser.me/api/portraits/men/47.jpg"),
                  // ),
                ],
              ),
              SizedBox(
                height: height * 0.6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: Text(S.of(context).settings),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AppSettings()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: width,
                  height: height * 0.06,
                  color: Colors.transparent,
                  child:  ListTile(
                    trailing: Icon(Icons.logout),
                    title: Text(S.of(context).logout,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Rock Salt")),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder<PackageInfo>(
            future: _getPackageInfo(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasError) {
                return const Text('ERROR');
              } else if (!snapshot.hasData) {
                return const Text('Loading...');
              }

              final data = snapshot.data!;

              return Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('App Naconst me: ${data.appName}',
                      style: const TextStyle(fontSize: 15)),
                  Text('Packconst age Name: ${data.packageName}',
                      style: const TextStyle(fontSize: 15)),
                  Text('Verconst sion: ${data.version}',
                      style: const TextStyle(fontSize: 15)),
                  Text('Build Number: ${data.buildNumber}',
                      style: const TextStyle(fontSize: 15)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
