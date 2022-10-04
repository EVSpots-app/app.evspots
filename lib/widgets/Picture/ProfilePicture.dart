
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:evspots/widgets/AlertDialog.dart';
import 'package:evspots/widgets/open_camera/bottompicker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? _image;


class ProfilePicture extends StatefulWidget {
  ProfilePicture({Key? key}) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
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
      child: MyPicture()
    );
  }
}

class MyPicture extends StatelessWidget {
  const MyPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width / 7,
      backgroundColor: Colors.grey,
      backgroundImage: _image != null
          ? FileImage(_image!) as ImageProvider
          : const AssetImage('assets/images/no-image.jpg'),
    );
  }
}

// class MyPicture2 extends StatelessWidget {
//   const MyPicture2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: SizedBox(
//           height: 100,
//           child: Image(
//             image: _image != null
//                 ? FileImage(_image!) as ImageProvider
//                 : AssetImage('assets/images/no-image.jpg'),
//           ),
//         ));
//   }
// }