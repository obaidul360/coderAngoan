import 'package:flutter/material.dart';

class AccountScreenPage extends StatefulWidget {
  const AccountScreenPage({super.key});

  @override
  State<AccountScreenPage> createState() => _AccountScreenPageState();
}

class _AccountScreenPageState extends State<AccountScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Account Page")));
  }
}
