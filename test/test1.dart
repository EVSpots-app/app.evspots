import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:http/http.dart' as http;

File? _image;
final picker = ImagePicker();

TextEditingController _imageController = TextEditingController();

Future getImageGallery() async {
  try {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image = File(image.path);

      Uint8List imageBytes = await image.readAsBytes(); //convert to bytes
      String base64string =
          base64.encode(imageBytes); //convert bytes to base64 constants
      _imageController.text = base64string.toString();
      _imageController.text = base64.encode(imageBytes).toString();
      debugPrint(base64string);
      //setState(() {});
    } else {
      debugPrint('No image selected.');
    }
  } catch (error) {
    debugPrint(error.toString());
  }
}

Future getImageCamera() async {
  var image = await ImagePicker().pickImage(source: ImageSource.camera);
  try {
    if (image != null) {
      _image = File(image.path);
      Uint8List imageBytes = await image.readAsBytes(); //convert to bytes
      String base64string =
          base64.encode(imageBytes); //convert bytes to base64 constants
      _imageController.text = base64string.toString();
      _imageController.text = base64.encode(imageBytes).toString();
      //    setState(() {});
    } else {
      debugPrint('No image selected.');
    }
  } catch (error) {
    debugPrint(error.toString());
  }
}

void showSheetGallery(context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext bc) {
      return Container(
        //width: Dimensions.screenWidth,
        height: 140,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              minLeadingWidth: 0.0,
              leading: const Icon(
                Icons.collections_rounded,
                color: Colors.grey,
              ),
              title: Text(
                'Gallery',
              ),
              onTap: () {
                Navigator.pop(context);
                getImageGallery();
              },
            ),
            ListTile(
              minLeadingWidth: 0.0,
              leading: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.grey,
              ),
              title: Text(
                'Camera',
              ),
              onTap: () {
                Navigator.pop(context);
                getImageCamera();
              },
            ),
          ],
        ),
      );
    },
  );
}
