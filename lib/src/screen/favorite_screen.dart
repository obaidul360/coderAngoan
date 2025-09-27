import 'package:flutter/material.dart';

class FavoriteScreenPage extends StatefulWidget {
  const FavoriteScreenPage({super.key});

  @override
  State<FavoriteScreenPage> createState() => _FavoriteScreenPageState();
}

class _FavoriteScreenPageState extends State<FavoriteScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Favorite Page")));
  }
}
