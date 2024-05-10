import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
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
          "Social Medias",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              height: 70,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(.3))),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child:
                      Container(width: 60, child: Image.asset("assets/fb.png")),
                ),
                title: Text(
                  "Facebook",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor,
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "IKIA Church",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor.withOpacity(.4),
                      fontWeight: FontWeight.w800),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              height: 70,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(.3))),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                      width: 60, child: Image.asset("assets/instagram.png")),
                ),
                title: Text(
                  "Instagram",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor,
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "@ikia_church",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor.withOpacity(.4),
                      fontWeight: FontWeight.w800),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              height: 70,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(.3))),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                      width: 60, child: Image.asset("assets/twitter.png")),
                ),
                title: Text(
                  "Twitter",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor,
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "@ikiachurch_offl",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor.withOpacity(.4),
                      fontWeight: FontWeight.w800),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              height: 70,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(.3))),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                      width: 60, child: Image.asset("assets/youtube.png")),
                ),
                title: Text(
                  "YouTube",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor,
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "@IKIA Videos",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor.withOpacity(.4),
                      fontWeight: FontWeight.w800),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              height: 70,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(.3))),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                      width: 60, child: Image.asset("assets/holy_church.png")),
                ),
                title: Text(
                  "Our Website",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor,
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "www.ikiachurch.com",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor.withOpacity(.4),
                      fontWeight: FontWeight.w800),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
