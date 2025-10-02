import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../details_page/provider_details.dart';
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

  // Carousel_Slider Code Start
  final List<Map<String, String>> cardList = [
    {
      "title": "Lenovo Laptop",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrADGeOQ3khxL75ZiMSEZEGIj6BOvwTxEm4g&s",
      "subtitle": "Normaly",
    },
    {
      "title": "Apple Laptop",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRInwp3KwXrDSLlYu5VB6A5wwEG-yblJD_EOw&s",
      "subtitle": "Best Configration",
    },
    {
      "title": "HP Laptop",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStI32PeS4sgS_RGrz5gdfnavR_9XyAqCRalg&s",
      "subtitle": "Best Performance",
    },
    {
      "title": "ASUS Laptop",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUwVGZ6HT3-2pBwchKGiBIwuFVMVAEpcyobg&s",
      "subtitle": "Good and Strong",
    },
  ];
  // Carousel_Slider Code end

  // Product image code Start
  final List<Map<String, dynamic>> products = [
    {
      "name": "পণ্য ১",
      "price": 100,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1ekySHHX-WmRWr0fcCisAPrMZcJhbJZ_qxg&s",
    },
    {
      "name": "পণ্য ২",
      "price": 200,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv9vtiHfzg5tEGfRT-LTdgLOGFQkTXZ_lahA&s",
    },
    {
      "name": "পণ্য ৩",
      "price": 300,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_qrn60hNTWePA-HrEZ-00j7kezLv-IgvGAw&s",
    },
    {
      "name": "পণ্য ৩",
      "price": 300,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPY96Uj9VUK1-Y1ldIX1PaAOTB0QGW9dIK2A&s",
    },
  ];

  // Product image code end

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<InfoProvider>(context);
    final modules = info.modles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFCFC),
        title: Center(
          child: Text(
            "CoderAngoan App",
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
            height: 250,
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: cardList.map((item) {
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
            height: 100,
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
                      child: Card(
                        elevation: 8,
                        child: Container(
                          //color: Color(0xFFD0CAC9),
                          width: 90,
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/thumbnails/004/297/596/small_2x/education-logo-open-book-dictionary-textbook-or-notebook-with-sunrice-icon-modern-emblem-idea-concept-design-for-business-libraries-schools-universities-educational-courses-vector.jpg",
                                ),
                                width: 30,
                                height: 30,
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
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          /* SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // left > right scroll
              child: Row(
                children: modules.map((product) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) =>
                              DetailScreen(productId: product.id),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        width: 180,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/004/297/596/small_2x/education-logo-open-book-dictionary-textbook-or-notebook-with-sunrice-icon-modern-emblem-idea-concept-design-for-business-libraries-schools-universities-educational-courses-vector.jpg"),
                                  )
                                ),

                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(product.lectuer),
                            Text(
                              product.price,
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                ).toList(),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
