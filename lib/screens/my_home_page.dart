import 'package:convida_ai_1/components/my_drawer.dart';
import 'package:convida_ai_1/screens/login_screen.dart';

import 'package:convida_ai_1/components/my_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_sliver_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
        slivers: <Widget>[
          const MySliverAppBar(),
          // deletar a partir daqui até o próximo comentário, pois este código serve apenas de teste
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                return const MyCard();
              },
              childCount: 20,
            ),
          ),
          // deletar até aqui para remover o código teste da sliverappbar
        ],
      );
            } else {
              return const LoginWidget();
            }
          }),
    );
  }
}
