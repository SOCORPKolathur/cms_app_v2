import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/community.dart';
import 'package:cms_app_v2/Views/company_details.dart';
import 'package:cms_app_v2/Views/product_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> fetchUniqueCompanies() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('Members')
          .get();

      List<String> companies = querySnapshot.docs
          .map((doc) => doc.data()['companyname'] as String)
          .toList();

      // Remove duplicates
      List<String> uniqueCompanies = companies.toSet().toList();
      return uniqueCompanies;
    } catch (e) {
      print('Error fetching companies: $e');
      return [];
    }
  }

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
              Navigator.of(context).pop();
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
        FutureBuilder<List<String>>(
        future: fetchUniqueCompanies(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Center(child: Text('No companies found.'));
      } else {
        List<String> companies = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: companies.length,
          itemBuilder: (context, index) {
            return companies[index] !="" ?
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CompanyDetails(companyname: companies[index],)));
                    },
                    child: ListTile(
                      leading: Container(
                        height: height / 12.56,
                        child: Image.asset("assets/Locationicon.png"),
                      ),
                      title: Text(
                        companies[index],
                        style: styles[index % styles.length],
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
                          FutureBuilder(
                            future: FirebaseFirestore.instance.collection('Members').where("companyname",isEqualTo: companies[index]).get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                    "${snapshot.data!.docs.length.toString()
                                        .padLeft(2, "0")}",
                                    style: GoogleFonts.sofiaSans(
                                        fontSize: 14,
                                        color: Color(0xff006BA6),
                                        fontWeight: FontWeight.w800));
                              }
                              return Text(
                                  "00",
                                  style: GoogleFonts.sofiaSans(
                                      fontSize: 14,
                                      color: Color(0xff006BA6),
                                      fontWeight: FontWeight.w800));
                            }
                          )
                        ],
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(top: height / 36),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CompanyDetails(companyname: companies[index],)));
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
                ],
              ) : SizedBox();
          },
        );
      }
    }
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
