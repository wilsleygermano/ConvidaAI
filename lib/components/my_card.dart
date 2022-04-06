import 'package:convida_ai_1/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key, this.eventName = 'Nome do Evento', this.eventDate = '07/07/2022', this.eventLocation = 'R.Nunes Machado, 1000'}) : super(key: key);

  final String eventName;
  final String eventDate;
  final String eventLocation;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 328,
          height: 112,
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage('lib/assets/festa.png'),
                        width: 96,
                        height: 96,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.event,
                          color: AppColors.miniIconsColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: AppColors.miniIconsColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Row(
                      children: [
                        Text(
                          widget.eventName,
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textFieldColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// ListTile(
//           leading: Image(
//             image: AssetImage('lib/assets/festa.png'),
//             width: 96,
//             height: 96,
//             alignment: Alignment.centerLeft,
//           ),
//           title: Text(
//             'Confraternização de fim de ano',
//             style: TextStyle(
//                 fontFamily: GoogleFonts.inter().fontFamily,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.titlesColor),
//           ),
//           subtitle: Text(
//             'Confraternização de fim de ano',
//             style: TextStyle(
//                 fontFamily: GoogleFonts.inter().fontFamily,
//                 fontSize: 8,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.textColor),
//           ),
//         ),