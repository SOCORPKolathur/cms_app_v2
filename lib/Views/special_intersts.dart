import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class SpecialInterests extends StatefulWidget {
  const SpecialInterests({super.key});

  @override
  State<SpecialInterests> createState() => _SpecialInterestsState();
}

class _SpecialInterestsState extends State<SpecialInterests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textColor,
            )),
        title: Text(
          "Special Interests",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: EmptyWidget(
          image: null,
          packageImage: PackageImage.Image_2 ,
          title: 'No Data',
          subTitle: 'No Data available yet',
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: primaryColor,
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 21, 226, 199),
          ),
        ),
      ),
    );
  }
}
