import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Widgets/loading.dart';
import 'package:cms_app_v2/Widgets/nodata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../constant.dart';
import 'package:intl/intl.dart';


class Notices extends StatefulWidget {
  String userphone;
   Notices({required this.userphone});

  @override
  State<Notices> createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  String obj = "Today";
  var _trimMode = TrimMode.Line;
  int _trimLines = 3;
  int _trimLength = 240;

  int today = 0;
  int upcomming =0;
  bool isloading =false;



  getdoccount() async {
    setState(() {
      isloading = true;
    });
    var docu = await FirebaseFirestore.instance.collection("Notices").where("date",isEqualTo: DateFormat('dd/MM/yyyy').format(DateTime.now())).get();
    var docu2 = await FirebaseFirestore.instance.collection("Notices").where("date",isNotEqualTo: DateFormat('dd/MM/yyyy').format(DateTime.now())).get();
    setState(() {
      today = docu.docs.length;
      upcomming = docu2.docs.length;
      isloading = false;
    });

  }

  @override
  void initState() {
    getdoccount();
    print(DateFormat('dd/MM/yyyy').format(DateTime.now()));
    // TODO: implement initState

  }
  setview() async {
    int temp=0;
    var docu = await FirebaseFirestore.instance.collection("Notices").where("date",isEqualTo: DateFormat('dd/MM/yyyy').format(DateTime.now())).get();
    temp = docu.docs.length<5?docu.docs.length : 5;
    for(int i=0;i<temp;i++){
      FirebaseFirestore.instance.collection("Notices").doc(docu.docs[i].id).update(
          {
            "views":FieldValue.arrayUnion([widget.userphone]),
          });
    }
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
              color: textColor,
            )),
        title: Text(
          "Notices",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,

          child: Column(
            children: <Widget>[
              SizedBox(
                height: height / 37.7,
              ),
              ButtonsTabBar(
                // height: 50,
                backgroundColor: primaryColor,

                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    child: Container(
                      height: height / 16.75,
                      width: width / 2.4,
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 75.4),
                        child: Text(
                          "Today",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: obj == "Today"
                                  ? textColor
                                  : textColor.withOpacity(.4),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                  Tab(

                    child: Container(
                      height: height / 16.75,
                      width: width / 2.4,
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 75.4),
                        child: Text(
                          "All Notices",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: obj == "All Notices"
                                  ? textColor
                                  : TextColor.withOpacity(.4),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                   isloading?LoadingState(): today>0?
                   StreamBuilder(
                     stream: FirebaseFirestore.instance.collection("Notices").orderBy("timestamp",descending: true).snapshots(),
                     builder: (context,snapshot){
                       if(snapshot.hasData) {
                         return ListView.builder(

        itemBuilder: (context, index) {
          var data = snapshot.data!.docs[index];

          return data["date"] ==
              DateFormat('dd/MM/yyyy').format(DateTime.now()).toString() ?
          VisibilityDetector(
            key: Key('my-widget-key2 $index'),
            onVisibilityChanged: (VisibilityInfo visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction;

              if (visiblePercentage > 0.50) {
                FirebaseFirestore.instance.collection("Notices")
                    .doc(data.id)
                    .update(
                    {
                      "views": FieldValue.arrayUnion([widget.userphone]),
                    }
                );
              }
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start,
                children: [
                  SizedBox(
                    height: height / 37.7,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width / 18),
                    child: Text(
                      data["title"],
                      style: GoogleFonts.sofiaSans(
                          fontSize: 20,
                          color: primaryColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width / 18),
                    child: ReadMoreText(
                      data["description"],
                      trimMode: _trimMode,
                      trimLines: _trimLines,
                      trimLength: _trimLength,
                      //isCollapsed: isCollapsed,
                      style: GoogleFonts.sofiaSans(
                          color: TextColor),
                      colorClickableText: primaryColor,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: ' Less',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width / 2.6,
                        top: height / 75.4),
                    child: Text(
                      "Posted at ${data["time"]} - ${data["date"]}",
                      style: GoogleFonts.sofiaSans(
                          fontSize: 14,
                          color: Color(0xFF262626)
                              .withOpacity(.7),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Divider(
                    color: Color(0xFF262626).withOpacity(
                        .2),
                    endIndent: 15,
                    indent: 15,
                  ),


                ],
              ),
            ),
          ) : SizedBox();
        },


        itemCount: snapshot.data!.docs.length,

      );
                       }
                       return LoadingState();
                     },
                   ) : Nodata(),
                    isloading?LoadingState(): upcomming>0?
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("Notices").orderBy("timestamp",descending: true).snapshots(),
                      builder: (context,snapshot){if(snapshot.hasData) {
                        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var data = snapshot.data!.docs[index];
            return data["date"] !=
                DateFormat('dd/MM/yyyy').format(DateTime.now()) ?
            VisibilityDetector(
              key: Key('my-widget-key2 $index'),
              onVisibilityChanged: (VisibilityInfo visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction;
                if (visiblePercentage > 0.50)
                  print(data["title"]);
                FirebaseFirestore.instance.collection("Notices")
                    .doc(data.id)
                    .update(
                    {
                      "views": FieldValue.arrayUnion([widget.userphone]),
                    }
                );
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start,
                  children: [
                    SizedBox(
                      height: height / 37.7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width / 18),
                      child: Text(
                        data["title"],
                        style: GoogleFonts.sofiaSans(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width / 18),
                      child: ReadMoreText(
                        data["description"],
                        trimMode: _trimMode,
                        trimLines: _trimLines,
                        trimLength: _trimLength,
                        //isCollapsed: isCollapsed,
                        style: GoogleFonts.sofiaSans(
                            color: TextColor),
                        colorClickableText: primaryColor,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: ' Less',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width / 2.6,
                          top: height / 75.4),
                      child: Text(
                        "Posted at ${data["time"]} - ${data["date"]}",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: Color(0xFF262626)
                                .withOpacity(.7),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Divider(
                      color: Color(0xFF262626).withOpacity(
                          .2),
                      endIndent: 15,
                      indent: 15,
                    ),


                  ],
                ),
              ),
            ) : SizedBox();
          }
      );
                      }
                        return LoadingState();
                      },
                    )  : Nodata(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
