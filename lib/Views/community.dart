import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/church_pastors.dart';
import 'package:cms_app_v2/Views/company.dart';
import 'package:cms_app_v2/Views/out_station.dart';
import 'package:cms_app_v2/Views/profession.dart';
import 'package:cms_app_v2/Views/special_intersts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Community",
          style: GoogleFonts.sofiaSans(
            fontWeight: FontWeight.w800,
            color: textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width / 18, top: width / 37.7),
              child: Container(
                width: width / 1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF5F5F5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search company, pastors,....',
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
              padding: EdgeInsets.only(top: height / 37.7, left: width / 18),
              child: Text(
                "Discover your church family",
                style: GoogleFonts.sofiaSans(
                  color: TextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 18,
              ),
              child: Container(
                width: width / 0.9,
                child: Text(
                  "Connect with Fellow Members and Build Meaningful Relationships",
                  style: GoogleFonts.sofiaSans(
                    color: TextColor.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height / 75.4, left: width / 24),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CompanyPage()));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: height / 5.8,
                          width: width / 2.25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/yellow.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width / 36, top: height / 9.42),
                            child: Text(
                              "Company",
                              style: GoogleFonts.sofiaSans(
                                color: textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 3.13, top: height / 9.42),
                          child: Container(
                            height: height / 25.13,
                            width: width / 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: textColor,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffE1C10B),
                              size: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 72, top: height / 75.4),
                          child: Container(
                            width: width / 6,
                            child: Image.asset("assets/company.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 36,
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 75.4),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfessionPage()));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: height / 5.8,
                          width: width / 2.25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/red.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width / 18, top: height / 9.42),
                            child: Text(
                              "Profession",
                              style: GoogleFonts.sofiaSans(
                                color: textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 36, top: height / 75.4),
                          child: Container(
                            width: width / 6,
                            child: Image.asset("assets/Profession.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 3, top: height / 9.42),
                          child: Container(
                            height: height / 25.13,
                            width: width / 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: textColor,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfessionPage()));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Color(0xffE66A40),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 24, top: height / 75.4),
                          child: Container(
                            width: width / 60,
                            child: Image.asset("assets/Profession.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OutStation()));
              },
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 24, top: height / 75.4),
                    child: Container(
                      width: width / 1.09,
                      child: Image.asset("assets/green_rect.png"),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 50.26, left: width / 18),
                    child: Container(
                      width: width / 5.14,
                      child: Image.asset("assets/star.png"),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 18, top: height / 50.26),
                    child: Container(
                      width: width / 6,
                      child: Image.asset("assets/out_station.png"),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 12, top: height / 8.37),
                    child: Row(
                      children: [
                        Text(
                          "Out Station Members",
                          style: GoogleFonts.sofiaSans(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 5.14),
                          child: Container(
                            height: height / 25.13,
                            width: width / 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: textColor,
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Color(0xff45B182),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 24,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChurchPastors()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: width / 2.25,
                        child: Image.asset("assets/blue.png"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 36, top: height / 50.26),
                        child: Container(
                          width: width / 7.2,
                          child: Image.asset("assets/Church Pastors.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 24, top: height / 10.05),
                        child: Row(
                          children: [
                            Container(
                              width: width / 4.23,
                              child: Text(
                                "Church Pastors",
                                style: GoogleFonts.sofiaSans(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width / 36,
                              ),
                              child: Container(
                                height: height / 25.13,
                                width: width / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: textColor,
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: Color(0xff5B93C4),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width / 36,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SpecialInterests()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: width / 2.25,
                        child: Image.asset("assets/pink_square.png"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height/75.4, left: width/72),
                        child: Container(
                          width: width/5.14,
                          child: Image.asset("assets/star.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 24, top: height / 30.16),
                        child: Container(
                          width: width / 9,
                          child: Image.asset("assets/music.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 24, top: height / 10.05),
                        child: Row(
                          children: [
                            Container(
                              width: width / 4.23,
                              child: Text(
                                "Special Interests",
                                style: GoogleFonts.sofiaSans(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                height: height / 25.13,
                                width: width / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: textColor,
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: Color(0xffEE516D),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
