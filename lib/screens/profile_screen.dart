import 'dart:convert';
import 'dart:io';

import 'package:evspots/widgets/languages.dart';
import 'package:evspots/widgets/open_camera/bottompicker_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../themes/app_color.dart';
import '../themes/theme_model.dart';
import '../widgets/AlertDialog.dart';
import 'package:http/http.dart' as http;

File? _image;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _callBackFunction(String name, String dialCode, String flag) {
    // place your code
  }

  TextEditingController myBirthDate = TextEditingController();

  String initValue="Select your Birth Date";
  bool isDateSelected= false;
  DateTime? birthDate; // instance of DateTime
  String? birthDateInString ='Write your birth date';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        // backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color:
                themeNotifier.isDark ? AppColor.bodyColor : AppColor.secColor,
          ),
          backgroundColor: Colors.transparent,
          // backgroundColor: themeNotifier.isDark
          //     ? AppColor.bodyColorDark
          //     : AppColor.bodyColor,
          // title: Text(
          //   S.of(context).profile,
          //   style: TextStyle(
          //       color: themeNotifier.isDark
          //           ? AppColor.bodyColor
          //           : AppColor.secColor,
          //       fontFamily: 'Tajawal-Black'),
          // ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).profile,
                    style: TextStyle(
                      fontSize: 40,
                        color: themeNotifier.isDark
                            ? AppColor.bodyColor
                            : AppColor.secColor,
                        fontFamily: 'Tajawal-Black'),
                  ),
                  Picture1(),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'First Name ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
               Padding(
                padding:  EdgeInsets.all(8.0),
                child:  TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'Last Name ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'Phone Number ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Email Address ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Birth Date ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  side:  BorderSide(color: Colors.grey.shade400, width: 1.5),
                ),
                title: Text("${birthDateInString}",style: TextStyle(fontSize: 20,),),
                trailing: Icon(Icons.calendar_today),
                  onTap: ()async{
                    final datePick= await showDatePicker(
                        context: context,
                        initialDate: new DateTime.now(),
                        firstDate: new DateTime(1900),
                        lastDate: new DateTime(2100)
                    );
                    if(datePick!=null && datePick!=birthDate){
                      setState(() {
                        birthDate=datePick;
                        isDateSelected=true;
                        birthDateInString = "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}";
                      });
                    }
                  }
              ),
            ),
          ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(child: Text('Gender*',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
               getWidget(true, true),

            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(8),
            height: height * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Update',
              style: TextStyle(fontSize: 18.0, color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    });
  }
}

class Picture1 extends StatefulWidget {
   Picture1({Key? key}) : super(key: key);

  @override
  State<Picture1> createState() => _Picture1State();
}

class _Picture1State extends State<Picture1> {
  final ImagePicker _picker = ImagePicker();


  TextEditingController _imageController = TextEditingController();

  bool uploadStatus = false;

  _imageFromCamera() async {
    final PickedFile? pickedImage =
    await _picker.getImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedImage == null) {
      /**/
      Uint8List imageBytes = await pickedImage!.readAsBytes(); //convert to bytes
      String base64string =
      base64.encode(imageBytes); //convert bytes to base64 constants
      _imageController.text = base64string.toString();
      _imageController.text = base64.encode(imageBytes).toString();
      debugPrint(base64string);
      /**/
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.");
      return;
    }
    final File fileImage = File(pickedImage.path);

    if (imageConstraint(fileImage))
      setState(() {
        _image = fileImage;
      });
  }

  _imageFromGallery() async {
    final PickedFile? pickedImage =
    await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) {
      /**/
      Uint8List imageBytes = await pickedImage!.readAsBytes(); //convert to bytes
      String base64string =
      base64.encode(imageBytes); //convert bytes to base64 constants
      _imageController.text = base64string.toString();
      _imageController.text = base64.encode(imageBytes).toString();
      debugPrint(base64string);
      /**/
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.",
      );
      return;
    }
    final File fileImage = File(pickedImage.path);
    if (imageConstraint(fileImage))
      setState(() {
        _image = fileImage;
      });
  }

  bool imageConstraint(File image) {
    if (!['bmp', 'jpg', 'jpeg']
        .contains(image.path.split('.').last.toString())) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image format should be jpg/jpeg/bmp.");
      return false;
    }
    if (image.lengthSync() > 100000) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image Size should be less than 100KB.");
      return false;
    }
    return true;
  }

  // uploadImage() async {
  //   if (_image == null) {
  //     showAlertDialog(
  //         context: context,
  //         title: "Error Uploading!",
  //         content: "No Image was selected.");
  //     return;
  //   }
  //
  //   setState(() {
  //     uploadStatus = true;
  //   });
  //   var response = await http
  //       .post(Uri.parse('https://pcc.edu.pk/ws/file_upload.php'), body: {
  //     "image": _image!.readAsBytes().toString(),
  //     "name": _image!.path.split('/').last.toString()
  //   });
  //   print('response');
  //   if (response.statusCode != 200) {
  //     showAlertDialog(
  //         context: context,
  //         title: "Error Uploading!",
  //         content: "Server Side Error.");
  //   } else {
  //     var result = jsonDecode(response.body);
  //     print(result);
  //     showAlertDialog(
  //         context: context, title: "Image Sent!", content: result['message']);
  //   }
  //   setState(() {
  //     uploadStatus = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        bottomPickerSheet(
            context, _imageFromCamera, _imageFromGallery);
      },
      child: Picker(),
    );
  }
}

class Picker extends StatelessWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(

      radius: MediaQuery.of(context).size.width / 7,
      backgroundColor: Colors.grey,
      backgroundImage: _image != null
          ? FileImage(_image!) as ImageProvider
          : const AssetImage('assets/images/no-image.jpg'),
    );
  }
}

Widget getWidget(bool showOtherGender, bool alignVertical) {
  return GenderPickerWithImage(
    showOtherGender: showOtherGender,
    verticalAlignedText: alignVertical,

    // to show what's selected on app opens, but by default it's Male
    selectedGender: Gender.Male,
    selectedGenderTextStyle: TextStyle(
        color: Color(0xFF8b32a8), fontWeight: FontWeight.bold,fontSize: 20),
    unSelectedGenderTextStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.normal,),
    onChanged: (Gender? gender) {
      print(gender);
    },
    //Alignment between icons
    equallyAligned: true,
    animationDuration: Duration(milliseconds: 300),
    isCircular: true,
    // default : true,
    opacityOfGradient: 0.4,
    padding: const EdgeInsets.all(3),
    size: 50, //default : 40
  );
}



// Row add_radio_button(int btnValue, String title) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: <Widget>[
//
//       Radio(
//         activeColor: Colors.green,
//         value: btnValue,
//         groupValue: -1,
//         onChanged: (int? value) {  },
//
//       ),
//       Text(title)
//     ],
//   );
// }




