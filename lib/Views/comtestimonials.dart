import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms_app_v2/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../Widgets/nodata.dart';
import '../constant.dart';

class ComTestimonials extends StatefulWidget {
  String userphone;
  ComTestimonials({required this.userphone});

  @override
  State<ComTestimonials> createState() => _ComTestimonialsState();
}

class _ComTestimonialsState extends State<ComTestimonials> {
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
          "Testimonials",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Testimonials").orderBy("timestamp",descending: true).snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index) {
                  if(snapshot.data!.docs.length==0){
                    return Nodata();
                  }
                  if(snapshot.hasData) {
                    var data = snapshot.data!.docs[index];
                    return data["status"] == "verified" ?
                    VisibilityDetector(
                      key: Key('my-widget-key2 $index'),
                      onVisibilityChanged: (VisibilityInfo visibilityInfo){
                        print(visibilityInfo.visibleFraction);
                        var visiblePercentage = visibilityInfo.visibleFraction;
                        if(visiblePercentage>0.50){
                          FirebaseFirestore.instance.collection("Testimonials").doc(data.id).update(
                              {
                                "views":FieldValue.arrayUnion([widget.userphone]),
                              }
                          );
                        }
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width / 30, top: height /
                                  37.7),
                              child: Text(
                                data["title"],
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 20,
                                    color: TextColor,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: width / 24, top: height /
                                  37.7),
                              child: Container(
                                width: width / 1.09,
                                child: Text(data["description"],
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.sofiaSans(
                                      fontSize: 16,
                                      color: TextColor.withOpacity(.6),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                           /* Row(
                              children: [
                                SizedBox(
                                  width: width / 36,
                                ),
                                Container(
                                  height: height / 18.85,
                                  child: Image.asset("assets/Loading (1).png"),
                                ),
                                Text("Status"),
                                SizedBox(
                                  width: width / 6,
                                ),
                                Text(":"),
                                SizedBox(
                                  width: width / 4,
                                ),
                                Container(
                                  height: height / 30.16,
                                  width: width / 3.6,
                                  decoration: BoxDecoration(
                                      color: data["status"] == "verified" ?
                                      Color(0xff00A15B).withOpacity(.2) :
                                      data["status"] == "unverified" ?
                                      Colors.red.withOpacity(.2) :
                                      Colors.orange.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: height / 377),
                                    child: Text(
                                      data["status"],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: data["status"] == "verified" ?
                                          Color(0xff00A15B) :
                                          data["status"] == "unverified" ?
                                          Colors.red :
                                          Colors.orange,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ],
                            ),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Shared on ${data['time']} - ${data['date']}",
                                    style: GoogleFonts.sofiaSans(
                                        fontSize: 14,
                                        color: TextColor.withOpacity(.4),
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: TextColor.withOpacity(.1),
                              endIndent: 10,
                              indent: 10,
                            ),
                          ],
                        ),
                      ),
                    ) :SizedBox();
                  }

                  return LoadingState();
                }
            );
          }
      ),
    );
  }
}
