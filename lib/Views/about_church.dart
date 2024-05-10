import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class AboutChurch extends StatefulWidget {
  const AboutChurch({super.key});

  @override
  State<AboutChurch> createState() => _AboutChurchState();
}

class _AboutChurchState extends State<AboutChurch> {
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
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textColor,
            )),
        title: Text(
          "About Church",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width/12,top: height/25.13),
              child: Row(
                children: [
                  SizedBox(
                    width: width/18,
                  ),
                  Container(
                    child: Image.asset("assets/Group 90 (1).png"),
                  ),
                  SizedBox(
                    width: width/36,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: height/18.85),
                    child: Container(
                      width: width/3.6,
                      child: Image.asset("assets/holy_church.png"),
                    ),
                  ),
                  SizedBox(
                    width: width/36,
                  ),
                  Container(
                    child: Image.asset("assets/Group 92 (1).png"),
                  ),
                ],
              ),
            ),
            Row(children: <Widget>[
              SizedBox(
                width: width/36,
              ),
              Container(
                height: height/75.4,
                child: Image.asset("assets/Vector_orange.png"),
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only( right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              Container(
                width: width/12,
                child: Image.asset("assets/cross_vector.png"),
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0,),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              Container(
                height: height/75.4,
                child: Image.asset("assets/Vector_orange.png"),
              ),
              SizedBox(
                width: width/36,
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(left: width/18),
              child: Text(
                  "Welcome to IKIA CHURCH, where faith, community, and service converge to "
                  "create a vibrant and welcoming environment for all. Founded on principles of"
                  " love, compassion, and spiritual growth, our church has been a cornerstone "
                  "of the community.\n\nOur mission is to spread the message of God's love and grace,"
                  " welcoming all who seek spiritual guidance and fellowship. We strive to create"
                  " a nurturing environment where individuals can deepen their relationship with God, "
                  "grow in faith, and serve others with compassion and humility.\n\nJoin us everydays of "
                  "the weekend for worship services that inspire and uplift. Our services blend traditional"
                  " and contemporary elements, featuring heartfelt praise and worship, dynamic sermons"
                  " rooted in scripture, and opportunities for prayer and reflection. We offer services for all ages,"
                  " including children's programs and youth ministries."),
            ),
            SizedBox(
              height: height/25.13,
            ),
          ],
        ),
      ),
    );
  }
}
