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
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
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
