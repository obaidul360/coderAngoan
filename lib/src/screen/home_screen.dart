import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../details_page/provider_details.dart';
import '../provider/carousel_slide.dart';
import '../provider/info_provider.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  //ImagePicked Code Start
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();
  Future<void> pickedImageGallery() async {
    final XFile? profilePhotoGallery = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (profilePhotoGallery != null) {
      setState(() {
        _image = File(profilePhotoGallery.path);
      });
    }
    Navigator.pop(context);
  }

  Future<void> pickedImageCamera() async {
    final XFile? profilePhotoCamera = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    if (profilePhotoCamera != null) {
      setState(() {
        _image = File(profilePhotoCamera.path);
      });
      Navigator.pop(context);
    }
  }

  void pickedImage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Camera"),
            onTap: pickedImageCamera,
          ),
          ListTile(
            leading: Icon(Icons.photo_library_outlined),
            title: Text("Gallery"),
            onTap: pickedImageGallery,
          ),
        ],
      ),
    );
  } //ImagePicked Code end

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<InfoProvider>(context);
    final modules = info.modles;
    final Slider = Provider.of<CarouselSliderProvider>(context);
    final slider = Slider.cardList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFCFC),
        title: Center(
          child: Text(
            "Coder Angoan",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add, color: Colors.black, size: 22),
          ),
          GestureDetector(
            onTap: pickedImage,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null ? Icon(Icons.person, size: 20) : null,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF0EBEB),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.red),
                        hintText: "Search...",
                        suffixIcon: Icon(Icons.search, size: 22),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(image: AssetImage("asset/ima.jpg")),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: slider.map((item) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Image.network(
                              item['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                item['subtitle']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 135,
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: modules.map((products) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(productId: products.id),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(),
                            ),
                            //color: Color(0xFFD0CAC9),
                            width: 90,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(products.image),
                                  height: 50,
                                  width: 55,
                                ),
                                Text(
                                  products.name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF22D51F),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  products.lectuer,
                                  style: TextStyle(color: Color(0xFFA93E8E)),
                                ),
                                Text(
                                  products.price,
                                  style: TextStyle(color: Color(0xFF386DBD)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
