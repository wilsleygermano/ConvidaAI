import 'package:convida_ai_1/design/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Text(
              'MENU',
              style: TextStyle(
                color: AppColors.titlesColor,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {},
            ),
            title: Text(
              'HOME',
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.titlesColor,
              ),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.info_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {},
            ),
            title: Text(
              'INFO',
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.titlesColor,
              ),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.logout_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () { FirebaseAuth.instance.signOut();
              Navigator.pop(context);},
            ),
            title: Text(
              'SAIR',
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.titlesColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
