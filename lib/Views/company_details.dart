import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms_app_v2/Widgets/nodata.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/company.dart';
import 'package:cms_app_v2/Views/product_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class CompanyDetails extends StatefulWidget {
  String companyname;
   CompanyDetails({required this.companyname});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {

  final List<TextStyle> styles = [
    GoogleFonts.sofiaSans(fontSize: 16, color: Color(0xffEE516D), fontWeight: FontWeight.w800),
    GoogleFonts.sofiaSans(fontSize: 16, color: Color(0xffFF7345), fontWeight: FontWeight.w800),
    GoogleFonts.sofiaSans(fontSize: 16, color: Color(0xff65A4DA), fontWeight: FontWeight.w800),
    GoogleFonts.sofiaSans(fontSize: 16, color: Color(0xff4DC591), fontWeight: FontWeight.w800),
    GoogleFonts.sofiaSans(fontSize: 16, color: Color(0xffF2D00D), fontWeight: FontWeight.w800),
  ];
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
          "Connect by companies",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
     /*       Padding(
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
            ),*/
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
                    widget.companyname,
                    style: GoogleFonts.sofiaSans(
                        fontSize: 20,
                        color: TextColor.withOpacity(.7),
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),

            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Members').where("companyname",isEqualTo: widget.companyname).snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: width / 1.6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 14.4),
                                        child: Text(
                                          snapshot.data!.docs[index]["firstName"],
                                          style: styles[index % styles.length],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 14.4),
                                        child: Text(snapshot.data!.docs[index]["position"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 16,
                                                color: TextColor.withOpacity(.6),
                                                fontWeight: FontWeight.w800)),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  height: height / 18.85,
                                  width: width / 9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF5F5F5),
                                  ),
                                  child: Icon(Icons.message_rounded,
                                    color: primaryColor,),
                                ),
                                SizedBox(
                                  width: width / 18,
                                ),
                                Container(
                                  height: height / 18.85,
                                  width: width / 9,
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
                              width: width / 1.12,
                              child: Divider(
                                color: TextColor.withOpacity(.1),
                              ),
                            ),
                          ],
                        );
                      }
                  );
                }
                return Nodata();
              }
            ),


        
          ],
        ),
      ),
    );
  }
}
