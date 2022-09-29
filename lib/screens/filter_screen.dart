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

class ConnectionType extends StatefulWidget {
  ConnectionType({Key? key}) : super(key: key);

  @override
  State<ConnectionType> createState() => _ConnectionTypeState();
}

class _ConnectionTypeState extends State<ConnectionType> {
  bool color2 = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        color2 = !color2;
        setState(() {
          this.color2 = color2;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          height: 110,
          width: 110,
          child: Stack(children: [
            SizedBox(
              height: 110,
              width: 110,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: this.color2
                        ? [Colors.blue, Colors.blue]
                        : [
                            Colors.blueAccent.withOpacity(0.05),
                            Colors.blueAccent.withOpacity(0.08),
                            Colors.blueAccent.withOpacity(0.2),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Text(
                  'Motasem',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset(
              'assets/images/connectionCar1.png',
            ),
          ]),
        ),
      ),
    );
  }
}

class AmenitiesChek extends StatefulWidget {
  const AmenitiesChek({Key? key}) : super(key: key);

  @override
  State<AmenitiesChek> createState() => _AmenitiesChekState();
}

class _AmenitiesChekState extends State<AmenitiesChek> {
  bool value4 = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Stack(
            children:  [
              const Positioned(
                  top: 20,
                  left: 20,
                  child: Icon(
                    Icons.fastfood,
                    size: 50,
                  )),
              const Positioned(
                  bottom: 2,
                  left: 30,
                  child: Text(
                    'Food',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,color: Colors.grey),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: this.value4,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value4 = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

