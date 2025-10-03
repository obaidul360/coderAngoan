import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coder/src/provider/info_provider.dart';
import 'package:coder/src/modle/modle_file.dart';

class DetailScreen extends StatelessWidget {
  final int productId;
  const DetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<InfoProvider>(context, listen: false);
    ProductModel product = info.Fint(productId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.topic,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 28,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
            color: Colors.indigo,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lecture No: ${product.lectuer}.",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Lecture Topic: ${product.topic}.",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Price: ${product.price}.",
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
