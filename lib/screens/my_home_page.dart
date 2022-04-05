import 'package:convida_ai_1/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../components/my_sliver_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginWidget());
  }

  //FirebaseFirestore firestore = FirebaseFirestore.instance;

}
