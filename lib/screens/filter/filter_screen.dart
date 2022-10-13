import 'package:evspots/widgets/home/filter_screen/amenitiesChek_with_chekBoxs.dart';
import 'package:evspots/widgets/home/filter_screen/connection_type_with_chekBoxs.dart';
import 'package:evspots/widgets/home/filter_screen/speeds_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/AppBar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(

        title: 'Filter',
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Apply',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connection type',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConnectionType(),
                    ConnectionType(),
                    ConnectionType(),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConnectionType(),
                    ConnectionType(),
                    ConnectionType(),
                  ],
                ),
              ),
              SizedBox(
                height: height*0.03,
              ),
              const Text(
                'Speeds',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SpeedsWidget(name: 'fast (1511w)',),
              SpeedsWidget(name: 'fast (1622w)',),
              SpeedsWidget(name: 'fast (1320w)',),
              SpeedsWidget(name: 'fast (1950w)',),
              SizedBox(
                height: height*0.03,
              ),
              const Text(
                'Amenities',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height*0.03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AmenitiesChek(),
                    const AmenitiesChek(),
                    const AmenitiesChek(),
                    const AmenitiesChek(),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AmenitiesChek(),
                    const AmenitiesChek(),
                    const AmenitiesChek(),
                    const AmenitiesChek(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






