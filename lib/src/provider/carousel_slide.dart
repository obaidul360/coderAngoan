import 'package:flutter/material.dart';

class CarouselSliderProvider with ChangeNotifier {
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
}
