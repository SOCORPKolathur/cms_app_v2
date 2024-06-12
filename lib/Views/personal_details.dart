import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/profile_page.dart';
import 'package:cms_app_v2/Widgets/loading.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class PersonalDetails extends StatefulWidget {
  String docid;
   PersonalDetails({required this.docid});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  String memberid="";
  getmemberdocid() async {
    var document = await FirebaseFirestore.instance.collection('Members').where('phone',isEqualTo: widget.docid).get();
    setState(() {
      memberid=document.docs[0].id;
    });
  }
  @override
  void initState() {
    getmemberdocid();
    // TODO: implement initState
    super.initState();
  }

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
              size: 20,
              color: textColor,
            )),
        title: Text(
          "Personal & Family",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: memberid!=""?FutureBuilder(
        future: FirebaseFirestore.instance.collection("Members").doc(memberid).get(),
        builder: (context, snapshot) {

          if(snapshot.hasData) {
            Map<String,dynamic> ? data = snapshot.data!.data();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: width / 2.4, top: height / 37.7),
                    child: Text(
                      "Personal Details",
                      style: GoogleFonts.sofiaSans(
                          fontSize: 20,
                          color: TextColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Badge.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Full Name",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Text(
                          "${data!["firstName"]} ${data["middleName"]} ${data["lastName"]}",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Business.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Profession",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Text(
                          data["position"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Wedding Rings.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Marital Status",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Text(
                          data["maritalStatus"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Home Address.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Locality",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Text(
                          data["city"]=="Select City"?"-":data["city"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 14.4,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: width / 24,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Address",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Container(
                          width: 130,
                          child: Text(
                            data["resistentialAddress"],
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 18.85,
                    width: width / 1.12,
                    child: Divider(
                      color: TextColor.withOpacity(.1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width / 2, top: height / 75.4),
                    child: Text(
                      "Family Details",
                      style: GoogleFonts.sofiaSans(
                          fontSize: 20,
                          color: TextColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Business.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Family ID",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Text(
                          data["familyid"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Family.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Family Name",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Text(
                          data["family"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Leader.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Leader Name",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9,
                        ),
                        Text(data["family"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                /*  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Home Address.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Contact Number",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9.47,
                        ),
                        Text(
                          data["alphone"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),*/
                  /*  Padding(
                  padding: EdgeInsets.only(top: height / 75.4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 18,
                      ),
                      Container(
                        height: height / 18.85,
                        child: Image.asset("assets/Group 32.png"),
                      ),
                      SizedBox(
                        width: width / 36,
                      ),
                      Text(
                        "Family Member\nCount",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.7),
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: width / 13.84,
                      ),
                      Text(
                        ":",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.7),
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: width / 9.47,
                      ),
                      Text(
                        "05",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.7),
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),*/
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 13,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Address",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9.47,
                        ),
                        Container(
                          width: 130,
                          child: Text(
                            data["resistentialAddress"],
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                  /*  Padding(
                  padding: EdgeInsets.only(top: height / 75.4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 18,
                      ),
                      Container(
                        height: height / 25.13,
                        child: Image.asset("assets/Locationicon.png"),
                      ),
                      SizedBox(
                        width: width / 36,
                      ),
                      Text(
                        "City",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.7),
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: width / 3.27,
                      ),
                      Text(
                        ":",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.7),
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: width / 9.47,
                      ),
                      Text(
                        "Chennai",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.7),
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),*/
                  Padding(
                    padding: EdgeInsets.only(top: height / 75.4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 18,
                        ),
                        Container(
                          height: height / 25.13,
                          child: Image.asset("assets/Pin Pad.png"),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Container(
                          width: width / 2.79,
                          child: Text(
                            "Pincode",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: TextColor.withOpacity(.7),
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 9.47,
                        ),
                        Text(
                          data["pincode"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.7),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 18.85,
                  ),
                ],
              ),
            );
          }

          return LoadingState();
        }
      ) : LoadingState(),
    );
  }
}
