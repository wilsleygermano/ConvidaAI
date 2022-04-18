import 'package:convida_ai_1/screens/my_home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/app_colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          title: Text('Sobre',
              style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titlesColor)),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
            const SizedBox(height: 16),
            Image.asset('lib/assets/convida_logo.png', width: 250, height: 75),
            const SizedBox(height: 60),
            Container(
                margin: const EdgeInsets.only(left: 28, right: 29),
                padding: const EdgeInsets.only(
                    top: 63, left: 22, right: 22, bottom: 78),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.titlesColor)),
                child: Column(
                  children: [
                    Text(
                        'Este aplicativo é um projeto da Snow Academy, idealizado por Thiago Nagaoka e Wilsley Germano.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            height: 2,
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    const SizedBox(height: 60),
                    ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () async {
                          await launch('https://github.com/nagaoka-thiago');
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const ImageIcon(
                                  AssetImage('lib/assets/github_logo.png'),
                                  color: Colors.white),
                              Text('https://github.com/nagaoka-thiago',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 12))
                            ])),
                    const SizedBox(height: 60),
                    ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () async {
                          await launch('https://github.com/wilsleygermano');
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const ImageIcon(
                                  AssetImage('lib/assets/github_logo.png'),
                                  color: Colors.white),
                              Text('https://github.com/wilsleygermano',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 12))
                            ]))
                  ],
                ))
          ])),
        ));
  }
}
