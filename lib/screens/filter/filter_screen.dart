import 'package:evspots/widgets/home/filter_screen/amenitiesChek_with_chekBoxs.dart';
import 'package:evspots/widgets/home/filter_screen/connection_type_with_chekBoxs.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Filter',
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConnectionType(),
                  ConnectionType(),
                  ConnectionType(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConnectionType(),
                  ConnectionType(),
                  ConnectionType(),
                ],
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
              ListTile(
                leading: Checkbox(
                  value: this.value1,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value1 = value!;
                    });
                  },
                ),
                title: const Text('fast (1511w)'
                  ,style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Checkbox(
                  value: this.value2,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value2 = value!;
                    });
                  },
                ),
                title: const Text('fast (1511w)'
                  ,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Checkbox(
                  value: this.value3,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value3 = value!;
                    });
                  },
                ),
                title: const Text('fast (1511w)'
                  ,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Checkbox(
                  value: this.value4,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value4 = value!;
                    });
                  },
                ),
                title: const Text('fast (1511w)'
                  ,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AmenitiesChek(),
                  const AmenitiesChek(),
                  const AmenitiesChek(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AmenitiesChek(),
                  const AmenitiesChek(),
                  const AmenitiesChek(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}






