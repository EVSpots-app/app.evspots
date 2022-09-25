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
  bool color = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.black87,
        title: Text('Filter'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Apply',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Connection type'),
              // SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                InkWell(
                  onTap: (){
                    color = ! color;
                    setState(() {
                      this.color = color;
                    });
                  },
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      color:
                      this.color
                          ? Colors.white
                          : Colors.blueAccent,

                      child: Stack(
                          children: [
                            Image.asset('assets/images/connectionCar1.png',),
                            Positioned(
                                top: 5,
                                left: 5,
                                child: Text('Tesla',style: TextStyle(fontWeight: FontWeight.bold),))
                          ],
                       ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Card(
                    child: Text('Motasem'),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Card(
                    child: Text('Motasem'),
                  ),
                )
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Card(
                    child: Text('Motasem'),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Card(
                    child: Text('Motasem'),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Card(
                    child: Text('Motasem'),
                  ),
                )
              ],),
              SizedBox(height: 30,),
              Text('Speeds'),
              ListTile(
                leading: Checkbox(
                  value: this.value1, onChanged: (bool? value) {
                  setState(() {
                    this.value1 = value!;
                  });
                },
                ),
                title: Text('fast'),
              ),
              ListTile(
                leading: Checkbox(
                  value: this.value2, onChanged: (bool? value) {
                  setState(() {
                    this.value2 = value!;
                  });
                },
                ),
                title: Text('fast'),
              ),
              ListTile(
                leading: Checkbox(
                  value: this.value3, onChanged: (bool? value) {
                  setState(() {
                    this.value3 = value!;
                  });
                },
                ),
                title: Text('fast'),
              ),
              ListTile(
                leading: Checkbox(
                  value: this.value4, onChanged: (bool? value) {
                  setState(() {
                    this.value4 = value!;
                  });
                },
                ),
                title: Text('fast'),
              ),
              SizedBox(height: 30,),
              Text('Amenities'),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(children: [
                          Positioned(
                              top: 20,
                              left: 20,
                              child: Icon(Icons.fastfood,size: 50,)),
                          Positioned(
                              bottom: 2,
                              left: 30,
                              child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Checkbox(
                            value: this.value4, onChanged: (bool? value) {
                            setState(() {
                              this.value4 = value!;
                            });
                          },
                          ),],),
                        ],),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(children: [
                          Positioned(
                              top: 20,
                              left: 20,
                              child: Icon(Icons.fastfood,size: 50,)),
                          Positioned(
                              bottom: 2,
                              left: 30,
                              child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Checkbox(
                            value: this.value4, onChanged: (bool? value) {
                            setState(() {
                              this.value4 = value!;
                            });
                          },
                          ),],),
                        ],),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(children: [
                          Positioned(
                              top: 20,
                              left: 20,
                              child: Icon(Icons.fastfood,size: 50,)),
                          Positioned(
                              bottom: 2,
                              left: 30,
                              child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Checkbox(
                            value: this.value4, onChanged: (bool? value) {
                            setState(() {
                              this.value4 = value!;
                            });
                          },
                          ),],),
                        ],),
                      ),

                    ),
                  ),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(children: [
                          Positioned(
                              top: 20,
                              left: 20,
                              child: Icon(Icons.fastfood,size: 50,)),
                          Positioned(
                              bottom: 2,
                              left: 30,
                              child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Checkbox(
                            value: this.value4, onChanged: (bool? value) {
                            setState(() {
                              this.value4 = value!;
                            });
                          },
                          ),],),
                        ],),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(children: [
                          Positioned(
                              top: 20,
                              left: 20,
                              child: Icon(Icons.fastfood,size: 50,)),
                          Positioned(
                              bottom: 2,
                              left: 30,
                              child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Checkbox(
                            value: this.value4, onChanged: (bool? value) {
                            setState(() {
                              this.value4 = value!;
                            });
                          },
                          ),],),
                        ],),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(children: [
                          Positioned(
                              top: 20,
                              left: 20,
                              child: Icon(Icons.fastfood,size: 50,)),
                          Positioned(
                              bottom: 2,
                              left: 30,
                              child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [Checkbox(
                            value: this.value4, onChanged: (bool? value) {
                            setState(() {
                              this.value4 = value!;
                            });
                          },
                          ),],),
                        ],),
                      ),

                    ),
                  ),
                ],),
            ],
          ),
        ),
      ),
    );
  }
}
