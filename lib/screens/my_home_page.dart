import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convida_ai_1/components/my_drawer.dart';
import 'package:convida_ai_1/screens/login_screen.dart';

import 'package:convida_ai_1/components/my_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../classes/evento.dart';
import '../components/my_sliver_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Evento> eventsList;

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  void getEvents() {
    eventsList = [];
    FirebaseFirestore.instance
        .collection('events')
        .where('user_uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.docs.forEach((doc) {
              setState(() => eventsList.add(Evento.fromJson(doc.data())));
            }));
  }

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
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MyCard(
                          eventName: eventsList[index].titulo,
                          eventDate: eventsList[index].data,
                          eventLocation: eventsList[index].local,
                          eventImage: NetworkImage(eventsList[index].url),
                        );
                      },
                      childCount: eventsList.length,
                    ),
                  ),
                ],
              );
            } else {
              return LoginWidget(
                mudarEstado: () {
                  setState(() {
                    getEvents();
                  });
                },
              );
            }
          }),
    );
  }
}
