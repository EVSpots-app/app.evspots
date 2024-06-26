import 'package:evspots/widgets/AppBar/AppBar.dart';
import 'package:evspots/widgets/CustomButton/custom_button.dart';
import 'package:flutter/material.dart';


class AddCheckIn extends StatelessWidget {
  const AddCheckIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: MyAppBar(
          title: 'Add Check-in',
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A233,World Motasem Park',
                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Business Center',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: height * 0.14,
                          child:
                              Image.asset('assets/images/ev_addCheck-in.png')),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share your experienc',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextField(
                          maxLines: 7,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.all(30),
                            hintText: 'Enter world about EV Spots',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Row(
                          children: [
                            Text(
                              'Add Photo',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '(Optional)',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.withOpacity(0.1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.green,
                                    size: 40,
                                  )),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Text(
                                'Upload Photo or Video ',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.2,
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
        bottomNavigationBar: MyButton(
          onTap: () {},
          title: 'Subnet',
        ));
  }
}
