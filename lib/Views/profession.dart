import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/community.dart';
import 'package:cms_app_v2/Views/company_details.dart';
import 'package:cms_app_v2/Views/product_page.dart';
import 'package:cms_app_v2/Views/profession_details.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class ProfessionPage extends StatefulWidget {
  const ProfessionPage({super.key});

  @override
  State<ProfessionPage> createState() => _ProfessionPageState();
}

class _ProfessionPageState extends State<ProfessionPage> {
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
          "Connect by Profession",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width / 18, top: height / 37.7),
              child: Container(
                width: width / 1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF5F5F5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search company names',
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfessionDetails()));
              },
              child: ListTile(
                leading: Container(
                  height: height / 12.56,
                  child: Image.asset("assets/Locationicon.png"),
                ),
                title: Text(
                  "Quantum Financials",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: Color(0xffFF7345),
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: height / 37.7,
                      child: Image.asset("assets/connect.png"),
                    ),
                    Text(" Members :   ",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 12,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800)),
                    Text("56",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xff006BA6),
                            fontWeight: FontWeight.w800))
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: height / 36),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfessionDetails()));
                    },
                    child: Container(
                      height: height / 15.08,
                      width: width / 12,
                      decoration: BoxDecoration(
                          color: TextColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffFF7345),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 0.10,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfessionDetails()));
              },
              child: ListTile(
                leading: Container(
                  height: height / 12.56,
                  child: Image.asset("assets/Locationicon.png"),
                ),
                title: Text(
                  "BlueWave Software",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: Color(0xff65A4DA),
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: height / 37.7,
                      child: Image.asset("assets/connect.png"),
                    ),
                    Text(" Members :   ",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 12,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800)),
                    Text("56",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xff006BA6),
                            fontWeight: FontWeight.w800))
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: height / 36),
                  child: Container(
                    height: height / 15.08,
                    width: width / 12,
                    decoration: BoxDecoration(
                        color: TextColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfessionDetails()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff65A4DA),
                          size: 20,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 0.10,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfessionDetails()));
              },
              child: ListTile(
                leading: Container(
                  height: height / 12.56,
                  child: Image.asset("assets/Locationicon.png"),
                ),
                title: Text(
                  "GreenLeaf Energies",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: Color(0xff4DC591),
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: height / 37.7,
                      child: Image.asset("assets/connect.png"),
                    ),
                    Text(" Members :   ",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 12,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800)),
                    Text("56",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xff006BA6),
                            fontWeight: FontWeight.w800))
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: height / 36),
                  child: Container(
                    height: height / 15.08,
                    width: width / 12,
                    decoration: BoxDecoration(
                        color: TextColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfessionDetails()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff4DC591),
                          size: 20,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 0.10,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfessionDetails()));
              },
              child: ListTile(
                leading: Container(
                  height: height / 12.56,
                  child: Image.asset("assets/Locationicon.png"),
                ),
                title: Text(
                  "CyberSecure IT",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: Color(0xffF2D00D),
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: height / 37.7,
                      child: Image.asset("assets/connect.png"),
                    ),
                    Text(" Members :   ",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 12,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800)),
                    Text("56",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xff006BA6),
                            fontWeight: FontWeight.w800))
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: height / 36),
                  child: Container(
                    height: height / 15.08,
                    width: width / 12,
                    decoration: BoxDecoration(
                        color: TextColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfessionDetails()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffF2D00D),
                          size: 20,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 0.10,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>ProfessionDetails()));
              },
              child: ListTile(
                leading: Container(
                  height: height / 12.56,
                  child: Image.asset("assets/Locationicon.png"),
                ),
                title: Text(
                  "AquaPura WaterWorks",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: Color(0xffEE516D),
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: height / 37.7,
                      child: Image.asset("assets/connect.png"),
                    ),
                    Text(" Members :   ",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 12,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800)),
                    Text("56",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xff006BA6),
                            fontWeight: FontWeight.w800))
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: height / 36),
                  child: Container(
                    height: height / 15.08,
                    width: width / 12,
                    decoration: BoxDecoration(
                        color: TextColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfessionDetails()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffEE516D),
                          size: 20,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 0.10,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfessionDetails()));
              },
              child: ListTile(
                leading: Container(
                  height: height / 12.56,
                  child: Image.asset("assets/Locationicon.png"),
                ),
                title: Text(
                  "Quantum Financials",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: Color(0xffFF7345),
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: height / 37.7,
                      child: Image.asset("assets/connect.png"),
                    ),
                    Text(" Members :   ",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 12,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800)),
                    Text("56",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xff006BA6),
                            fontWeight: FontWeight.w800))
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: height / 36),
                  child: Container(
                    height: height / 15.08,
                    width: width / 12,
                    decoration: BoxDecoration(
                        color: TextColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfessionDetails()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffFF7345),
                          size: 20,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 0.10,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfessionDetails()));
              },
              child: ListTile(
                leading: Container(
                  height: height / 12.56,
                  child: Image.asset("assets/Locationicon.png"),
                ),
                title: Text(
                  "Quantum Financials",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: Color(0xffFF7345),
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: height / 37.7,
                      child: Image.asset("assets/connect.png"),
                    ),
                    Text(" Members :   ",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 12,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800)),
                    Text("56",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xff006BA6),
                            fontWeight: FontWeight.w800))
                  ],
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: height / 36),
                  child: Container(
                    height: height / 15.08,
                    width: width / 12,
                    decoration: BoxDecoration(
                        color: TextColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfessionDetails()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffFF7345),
                          size: 20,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 0.10,
              child: Divider(
                color: TextColor.withOpacity(.1),
              ),
            ),
            SizedBox(
              height: height / 25.13,
            ),
          ],
        ),
      ),
    );
  }
}
