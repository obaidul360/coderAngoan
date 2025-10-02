import 'package:coder/src/modle/modle_file.dart';
import 'package:flutter/material.dart';

class InfoProvider with ChangeNotifier{
  List<ProductModel> _module=[
    ProductModel(id: 1, name: "Coder Angoan", lectuer: "1st Lecture", topic: "Overview", price: "Free", image: "", assignment: ""),
    ProductModel(id: 2, name: "Coder Angoan", lectuer: "2nd Lecture", topic: "Variable", price: "Free", image: "",assignment: ""),
    ProductModel(id: 3, name: "Coder Angoan", lectuer: "3rd Lecture", topic: "Data_Type", price: "Free", image: "",assignment:""),
    ProductModel(id: 4, name: "Coder Angoan", lectuer: "4th Lecture", topic: "Operator", price: "Free", image: "", assignment: ""),
    ProductModel(id: 5, name: "Coder Angoan", lectuer: "5th Lecture", topic: "List", price: "Free", image: "", assignment: ""),
    ProductModel(id: 6, name: "Coder Angoan", lectuer: "6th Lecture", topic: "Map", price: "Free", image: "", assignment: ""),

  ];
  List<ProductModel>get modles =>_module;

  ProductModel Fint(int id){
    return _module.firstWhere((item){
      return item.id ==id;
    });
  }



}
