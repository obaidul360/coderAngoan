import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDAC6C2),
        title: Center(
          child: Text(
            "App Bar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.black, size: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black, size: 22),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_important_outlined, color: Colors.black, size: 22),
          ),
        ],
      ),
      backgroundColor: Color(0xFFA1A1A1),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 250,
          width: 270,
          decoration: BoxDecoration(
            color: Color(0xFFB9A4A0),
            border: Border(
              top: BorderSide(color: Colors.red, width: 3),
              bottom: BorderSide(color: Colors.orange, width: 3),
              left: BorderSide(color: Colors.deepPurpleAccent, width: 3),
              right: BorderSide(color: Colors.blueAccent, width: 3),
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Navigation Bar Down",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.arrow_downward, size: 25, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
