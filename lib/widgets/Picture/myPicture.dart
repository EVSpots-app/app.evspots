
import 'dart:io';

import 'package:flutter/material.dart';

File? _image;


class MyPicture extends StatelessWidget {
  const MyPicture({Key? key}) : super(key: key);

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