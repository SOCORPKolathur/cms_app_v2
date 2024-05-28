import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../constant.dart';

class ChurchPastors extends StatefulWidget {
   ChurchPastors({super.key});

  @override
  State<ChurchPastors> createState() => _ChurchPastorsState();
}

class _ChurchPastorsState extends State<ChurchPastors> {

  final List<Color> styles = [
    Color(0xffEE516D),
   Color(0xffFF7345),
    Color(0xff65A4DA),
   Color(0xff4DC591),
    Color(0xffF2D00D),
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
          "Church Pastors",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("Pastors").orderBy("timestamp",descending: true).snapshots(),
                builder: (context, snapshot) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index) {
                    return Padding(
                      padding:  EdgeInsets.only(left: width/18, top: height/37.7,right:width/18 ),
                      child: Container(
                        height: height/4.71,
                        width: width/1.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xff000000).withOpacity(.1)),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: width/7.2,
                                    height: height/14,
                                   
                                    decoration: BoxDecoration(
                                        color: styles[index % styles.length].withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: snapshot.data!.docs[index]["imgUrl"]!=""? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(snapshot.data!.docs[index]["imgUrl"],fit: BoxFit.cover,)) : Center(child: Icon(Icons.person,color: styles[index % styles.length],size: 34,)),
                                  ),
                                  title: Text(
                                    snapshot.data!.docs[index]["firstName"],
                                    style: GoogleFonts.sofiaSans(
                                        fontSize: 14,
                                        color: TextColor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  subtitle: Text(
                                    snapshot.data!.docs[index]["position"],
                                    style: GoogleFonts.sofiaSans(
                                        fontSize: 14,
                                        color: TextColor.withOpacity(.5),
                                        fontWeight: FontWeight.w800),
                                  ),
                                 /* trailing: Padding(
                                    padding:  EdgeInsets.only(bottom: height/50.26),
                                    child: Text(
                                      "( IKIA Curch )",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 12,
                                          color: primaryColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),*/
                                ),
                                SizedBox(
                                  height: height/37.7,
                                  width: width/1.12,
                                  child:
                                      Divider(color: Color(0xff000000).withOpacity(.1)),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/72),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: styles[index % styles.length],
                                      ),
                                      Text(
                                        "Chennai",
                                        style: GoogleFonts.sofiaSans(
                                            fontSize: 14,
                                            color: TextColor.withOpacity(.5),
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: width/4.5,
                                      ),
                                      Container(
                                        height: height/16.08,
                                        width: width/2.4,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: primaryColor,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width/18,
                                            ),
                                            Icon(
                                              Icons.phone,
                                              color: textColor,
                                            ),
                                            Text(
                                              "Contact Now",
                                              style: GoogleFonts.sofiaSans(
                                                  fontSize: 14,
                                                  color: textColor,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: height/5.23),
                              child: Container(
                                width: width/1.12,
                                height: 20,

                                decoration: BoxDecoration(
                                    color: styles[index % styles.length],
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                );
              }
            ),

            SizedBox(height: height/25.13,)
          ],
        ),
      ),
    );
  }
}
