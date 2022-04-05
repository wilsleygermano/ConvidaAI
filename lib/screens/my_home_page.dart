import 'package:convida_ai_1/components/my_card.dart';
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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(), 
          // deletar a partir daqui até o próximo comentário, pois este código serve apenas de teste
          SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MyCard();
              },
              childCount: 20,
            ),
            ),
            // deletar até aqui para remover o código teste da sliverappbar 
        ],
      ),
    );
  }
  
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  }
