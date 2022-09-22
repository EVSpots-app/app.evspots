import 'dart:convert';
import 'dart:io';

import 'package:evspots/widgets/open_camera/bottompicker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../themes/app_color.dart';
import '../themes/theme_model.dart';
import '../widgets/AppBar.dart';
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
          iconTheme: IconThemeData(
            color:
                themeNotifier.isDark ? AppColor.bodyColor : AppColor.secColor,
          ),
          backgroundColor: themeNotifier.isDark
              ? AppColor.bodyColorDark
              : AppColor.bodyColor,
          title: Text(
            S.of(context).profile,
            style: TextStyle(
                color: themeNotifier.isDark
                    ? AppColor.bodyColor
                    : AppColor.secColor,
                fontFamily: 'Tajawal-Black'),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Picture1(),
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
              SizedBox(
                height: height * 0.02,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
              SizedBox(
                height: height * 0.02,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
              SizedBox(
                height: height * 0.02,
              ),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
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
              SizedBox(
                height: height * 0.02,
              ),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
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
              style: TextStyle(fontSize: 18.0, color: Colors.black),
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



  bool uploadStatus = false;

  _imageFromCamera() async {
    final PickedFile? pickedImage =
    await _picker.getImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedImage == null) {
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
      radius: MediaQuery.of(context).size.width / 6,
      backgroundColor: Colors.grey,
      backgroundImage: _image != null
          ? FileImage(_image!) as ImageProvider
          : const AssetImage('assets/images/no-image.jpg'),
    );
  }
}


