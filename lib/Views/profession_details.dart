import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/company.dart';
import 'package:cms_app_v2/Views/product_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class ProfessionDetails extends StatefulWidget {
  const ProfessionDetails({super.key});

  @override
  State<ProfessionDetails> createState() => _ProfessionDetailsState();
}

class _ProfessionDetailsState extends State<ProfessionDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textColor,
            )),
        title: Text(
          "Connect by profession",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width/18, top: height/37.7),
              child: Container(
                width: width/0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF5F5F5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Names, Numbers',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: TextColor.withOpacity(.3),
                        ),
                      ),
                      hintStyle: GoogleFonts.sofiaSans(
                          color: Color(0xff262626).withOpacity(.3))),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: height/37.7, left: width/18),
              child: Text(
                "Members of your selected companies",
                style: GoogleFonts.sofiaSans(
                  color: TextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              width: width/1.12,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width/36),
              child: Row(
                children: [
                  Container(
                    height: height/12.56,
                    child: Image.asset("assets/Locationicon.png"),
                  ),
                  Text(
                    "Quantum Financials",
                    style: GoogleFonts.sofiaSans(
                        fontSize: 20,
                        color: TextColor.withOpacity(.3),
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width/14.4),
                      child: Text(
                        "Ambetkar  R",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 18,
                            color: Color(0xffFF7345),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: width/12),
                      child: Text("Driver",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                SizedBox(
                  width: width/3.6,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.message_rounded, color: primaryColor,),
                ),
                SizedBox(
                  width: width/18,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.phone,
                    color: primaryColor,),
                )
              ],
            ),
            SizedBox(
              width: width/1.12,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: width/14.4),
                      child: Text(
                        "Raj Kumar  R",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 18,
                            color: Color(0xff65A4DA),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: width/12),
                      child: Text("Driver",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                SizedBox(
                  width: width/3.6,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.message_rounded, color: primaryColor,),
                ),
                SizedBox(
                  width: width/18,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.phone,
                    color: primaryColor,),
                )
              ],
            ),
            SizedBox(
              width: width/1.12,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width/14.4),
                      child: Text(
                        "Raj Kumar  R",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 18,
                            color: Color(0xff4DC591),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: width/12),
                      child: Text("Driver",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                SizedBox(
                  width: width/3.6,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.message_rounded, color: primaryColor,),
                ),
                SizedBox(
                  width: width/18,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.phone,
                    color: primaryColor,),
                )
              ],
            ),
            SizedBox(
              width: width/1.12,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width/14.4),
                      child: Text(
                        "John David",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 18,
                            color: Color(0xffE9CC25),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: width/18),
                      child: Text("Driver",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                SizedBox(
                  width: width/3.13,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.message_rounded, color: primaryColor,),
                ),
                SizedBox(
                  width: width/18,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.phone,
                    color: primaryColor,),
                )
              ],
            ),
            SizedBox(
              width: width/1.12,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: width/14.4),
                      child: Text(
                        "Raj Kumar  R",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 18,
                            color: Color(0xff65A4DA),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: width/12),
                      child: Text("Driver",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                SizedBox(
                  width: width/3.6,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.message_rounded, color: primaryColor,),
                ),
                SizedBox(
                  width: width/18,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.phone,
                    color: primaryColor,),
                )
              ],
            ),
            SizedBox(
              width: width/1.12,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width/14.4),
                      child: Text(
                        "Raj Kumar  R",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 18,
                            color: Color(0xff4DC591),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width/12),
                      child: Text("Driver",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                SizedBox(
                  width: width/3.6,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.message_rounded, color: primaryColor,),
                ),
                SizedBox(
                  width: width/18,
                ),
                Container(
                  height: height/18.85,
                  width: width/9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Icon(Icons.phone,
                    color: primaryColor,),
                )
              ],
            ),
            SizedBox(
              height: height/3.75,
            ),

          ],
        ),
      ),
    );
  }
}
