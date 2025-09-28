import 'package:flutter/material.dart';

class CartScreenPage extends StatefulWidget {
  const CartScreenPage({super.key});

  @override
  State<CartScreenPage> createState() => _CartScreenPageState();
}

class _CartScreenPageState extends State<CartScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Cart Page"),),);
  }
}




/*
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}


class _HomeScreenPageState extends State<HomeScreenPage> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickedImageGallery() async {
    final XFile? profilePhoto = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (profilePhoto != null) {
      setState(() {
        _image = File(profilePhoto.path);
      });
    }
    Navigator.pop(context);
  }

  Future<void> pickedImageCamera() async {
    final XFile? profilePhoto = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    if (profilePhoto != null) {
      setState(() {
        _image = File(profilePhoto.path);
      });
      Navigator.pop(context);
    }
  }

  void pickedImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) =>
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                  onTap: pickedImageCamera,
                ),
                ListTile(
                  leading: Icon(Icons.photo_library_outlined),
                  title: Text("Gallery"),
                  onTap: pickedImageGallery,
                )
              ],
            )

    );
  }
}


@override
Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xFFFCFCFC),
      title: Center(
        child: Text(
          "App Bar",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.black, size: 22),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add, color: Colors.black, size: 22),
          ),
        ),
        GestureDetector(
          onTap: pickedImage,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null ? Icon(Icons.person, size: 20) : null,
          ),
        ),
      ],
    ),
    backgroundColor: Color(0xFFF0EBEB),
    body: SingleChildScrollView(child: Container()),
  );
}
}
*/

