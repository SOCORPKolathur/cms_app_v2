import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../constant.dart';

class BlogExpanded extends StatefulWidget {
  String docid="";
   BlogExpanded({required this.docid});

  @override
  State<BlogExpanded> createState() => _BlogExpandedState();
}

class _BlogExpandedState extends State<BlogExpanded> {
  int count = 0;

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
          "Blogs",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Blogs").doc(widget.docid).get(),

          builder: (context, snapshot) {
            Map<String,dynamic> ? data = snapshot.data!.data();
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/12, top: height/25.13),
                  child: Container(
                      width: width/1.2,
                      child: Column(
                        children: [
                          Text(
                            data!["title"],
                            style: GoogleFonts.sofiaSans(
                                fontSize: 20,
                                color: TextColor,
                                fontWeight: FontWeight.w800),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: width/3),
                            child: Text(" -${data["author"]}"),
                          ),
                          Row(
                            children: [
                              Text(
                                "Posted on ${data["time"]}",
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 14,
                                    color: TextColor,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: width/3.5,
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: primaryColor,
                                  size: 14,
                                ),
                              ),
                              SizedBox(
                                width: width/36,
                              ),
                              Text(
                             "${ count}",
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 14,
                                    color: TextColor,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: width/25.6,
                              ),
                              InkWell(
                                onTap: (){
                                  Share.share(
                                      'check out my website https://example.com',
                                      subject: 'Look what I made!');
                                },
                                child: Icon(
                                  Icons.share,
                                  color: primaryColor,
                                  size: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width/18, top: height/37.7),
                  child: Container(
                    width: width/1.12,
                    child: ClipRRect(
            borderRadius: BorderRadius.circular(20),

                        child: Image.network(data["imgUrl"],fit: BoxFit.cover,)),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width/18, top: height/25.13),
                  child: Container(
                    width: width/1.12,
                    child: Text(data["description"],
                      style: GoogleFonts.sofiaSans(
                          fontSize: 16,
                          color: TextColor.withOpacity(.3),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                SizedBox(
                  height: height/25.13,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
