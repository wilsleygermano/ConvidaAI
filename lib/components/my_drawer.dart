import 'package:convida_ai_1/design/app_colors.dart';
import 'package:convida_ai_1/screens/about_screen.dart';
import 'package:convida_ai_1/screens/my_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            ListTile(
              leading: IconButton(
                iconSize: 48,
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.buttonsColor,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage())),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Text(
                  'HOME',
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titlesColor,
                  ),
                ),
              ),
            ),
            Divider(
              color: AppColors.miniTextColor,
              thickness: 1,
            ),
            ListTile(
              leading: IconButton(
                iconSize: 48,
                icon: Icon(
                  Icons.info_outlined,
                  color: AppColors.buttonsColor,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutWidget()));
                },
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Text(
                  'SOBRE',
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titlesColor,
                  ),
                ),
              ),
            ),
            Divider(
              color: AppColors.miniTextColor,
              thickness: 1,
            ),
            ListTile(
              leading: IconButton(
                iconSize: 48,
                icon: Icon(
                  Icons.logout_outlined,
                  color: AppColors.buttonsColor,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Text(
                  'SAIR',
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titlesColor,
                  ),
                ),
              ),
            ),
            Divider(
              color: AppColors.miniTextColor,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
