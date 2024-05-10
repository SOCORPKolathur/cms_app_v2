import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../Widgets/loading.dart';
import '../Widgets/nodata.dart';
import '../constant.dart';
import 'package:intl/intl.dart';


class EventsScreen extends StatefulWidget {
  String userphone;
  EventsScreen({required this.userphone});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  var _trimMode = TrimMode.Line;
  int _trimLines = 3;
  int _trimLength = 240;
  String obj = "Today";


  int today = 0;
  int upcomming =0;



  getdoccount() async {
    var docu = await FirebaseFirestore.instance.collection("Events").where("date",isEqualTo: DateFormat('dd/MM/yyyy').format(DateTime.now())).get();
    var docu2 = await FirebaseFirestore.instance.collection("Events").where("date",isNotEqualTo: DateFormat('dd/MM/yyyy').format(DateTime.now())).get();
    setState(() {
      today = docu.docs.length;
      upcomming = docu2.docs.length;
    });

  }
  setview() async {
    int temp=0;
    var docu = await FirebaseFirestore.instance.collection("Events").where("date",isEqualTo: DateFormat('dd/MM/yyyy').format(DateTime.now())).get();
    temp = docu.docs.length<5?docu.docs.length : 5;
    for(int i=0;i<temp;i++){
      FirebaseFirestore.instance.collection("Events").doc(docu.docs[i].id).update(
          {
            "views":FieldValue.arrayUnion([widget.userphone]),
          });
    }
  }

  @override
  void initState() {
    getdoccount();
    //setview();
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
              color: textColor,
            )),
        title: Text(
          "Events",
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
                height: height/37.7,
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
                      height:height/16.75,
                      width: width/2.4,
                      child: Padding(
                        padding: EdgeInsets.only(top: height/75.4),
                        child: Text(
                          "Today",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: obj == "Today"
                                  ? textColor.withOpacity(.7)
                                  : TextColor.withOpacity(.4),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height:height/16.75,
                      width: width/2.4,
                      child: Padding(
                        padding:  EdgeInsets.only(top: height/75.4),
                        child: Text(
                          "All Events",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: obj == "All Events"
                                  ? textColor.withOpacity(.7)
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
                    today>0?
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("Events").orderBy("timestamp",descending: true).snapshots(),
                      builder: (context,snapshot){

                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index) {
                              if(snapshot.hasData) {
                                var data = snapshot.data!.docs[index];

                                return data["date"] == DateFormat('dd/MM/yyyy').format(DateTime.now())?
                                VisibilityDetector(
                                  key: Key('my-widget-key2 $index'),
                                  onVisibilityChanged: (VisibilityInfo visibilityInfo){
                                    var visiblePercentage = visibilityInfo.visibleFraction;
                                    if(visiblePercentage>0.50){
                                      FirebaseFirestore.instance.collection("Events").doc(data.id).update(
                                          {
                                            "views":FieldValue.arrayUnion([widget.userphone]),
                                          }
                                      );
                                    }
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height/37.7,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width/18,
                                            ),
                                            Container(
                                              height: height/37.7,
                                              width: width/18,
                                              child: Image.asset("assets/calender.png"),
                                            ),
                                            SizedBox(
                                              width: width/36,
                                            ),
                                            Text(
                                              data["date"],
                                              style: GoogleFonts.sofiaSans(
                                                  fontSize: 16,
                                                  color: TextColor.withOpacity(.5),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(
                                              width: width/5.14,
                                            ),
                                            Container(
                                              height: height/37.7,
                                              width: width/18,
                                              child: Image.asset("assets/Time.png"),
                                            ),
                                            SizedBox(
                                              width: width/36,
                                            ),
                                            Text(
                                              data["time"],
                                              style: GoogleFonts.sofiaSans(
                                                  fontSize: 16,
                                                  color: TextColor.withOpacity(.5),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                        ListTile(
                                          leading: Container(
                                            width: width/7.2,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20)),
                                            child: Image.network(data["imgUrl"]),
                                          ),
                                          title: Text(
                                            data["title"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 20,
                                                color: TextColor,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.green,
                                                size: 15,
                                              ),
                                              Text(data["location"],
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 12,
                                                      color: TextColor.withOpacity(.5),
                                                      fontWeight: FontWeight.w800)),
                                            ],
                                          ),
                                          trailing: Container(
                                            height: height/18.85,
                                            width: width/3.6,
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(top: height/94.25),
                                              child: Text(
                                                "Register",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.sofiaSans(
                                                    fontSize: 16,
                                                    color: textColor.withOpacity(.7),
                                                    fontWeight: FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height/75.4,
                                        ),
                                   /*     Padding(
                                          padding: EdgeInsets.only(right: width/2.3),
                                          child: Text(
                                            data["date"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 16,
                                                color: TextColor.withOpacity(.5),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height/75.4,
                                        ),*/
                                        Row(
                                          children: [
                                            Padding(
                                              padding:EdgeInsets.only(left: width/24),
                                              child: Container(
                                                width: width/1.16,
                                                child: ReadMoreText(
                                                  data["description"],

                                                  trimMode: _trimMode,
                                                  trimLines: _trimLines,
                                                  trimLength: _trimLength,
                                                  //isCollapsed: isCollapsed,
                                                  style:
                                                  GoogleFonts.sofiaSans(color: TextColor),
                                                  colorClickableText: primaryColor,
                                                  trimCollapsedText: 'Read more',
                                                  trimExpandedText: ' Less',
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(top: height/15.08),
                                              child: InkWell(
                                                onTap: () {
                                                  Share.share(
                                                      'check out my website https://example.com',
                                                      subject: 'Look what I made!');
                                                },
                                                child: Icon(
                                                  Icons.share,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.grey.withOpacity(.3),
                                          endIndent: 10,
                                          indent: 10,
                                        ),

                                      ],
                                    ),
                                  ),
                                ) : SizedBox();
                              }
                              return LoadingState();
                            }
                        );
                      },
                    ) : Nodata(),
                    upcomming>0?
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("Events").orderBy("timestamp",descending: true).snapshots(),
                      builder: (context,snapshot){
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.docs[index];
                                return data["date"] != DateFormat('dd/MM/yyyy').format(DateTime.now()) ?
                                VisibilityDetector(
                                  key: Key('my-widget-key2 $index'),
                                  onVisibilityChanged: (VisibilityInfo visibilityInfo){
                                    print(visibilityInfo);
                                    var visiblePercentage = visibilityInfo.visibleFraction;
                                    if(visiblePercentage>0.50){
                                      FirebaseFirestore.instance.collection("Events").doc(data.id).update(
                                          {
                                            "views":FieldValue.arrayUnion([widget.userphone]),
                                          }
                                      );
                                    }
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height/37.7,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width/18,
                                            ),
                                            Container(
                                              height: height/37.7,
                                              width: width/18,
                                              child: Image.asset("assets/calender.png"),
                                            ),
                                            SizedBox(
                                              width: width/36,
                                            ),
                                            Text(
                                              data["date"],
                                              style: GoogleFonts.sofiaSans(
                                                  fontSize: 16,
                                                  color: TextColor.withOpacity(.5),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(
                                              width: width/5.14,
                                            ),
                                            Container(
                                              height: height/37.7,
                                              width: width/18,
                                              child: Image.asset("assets/Time.png"),
                                            ),
                                            SizedBox(
                                              width: width/36,
                                            ),
                                            Text(
                                              data["time"],
                                              style: GoogleFonts.sofiaSans(
                                                  fontSize: 16,
                                                  color: TextColor.withOpacity(.5),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                        ListTile(
                                          leading: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(60)),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(60),
                                                child: Image.network(data["imgUrl"],fit: BoxFit.cover,)),
                                          ),
                                          title: Text(
                                            data["title"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 20,
                                                color: TextColor,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.green,
                                                size: 15,
                                              ),
                                              Text(data["location"],
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 12,
                                                      color: TextColor.withOpacity(.5),
                                                      fontWeight: FontWeight.w800)),
                                            ],
                                          ),
                                          trailing: Container(
                                            height: height/18.85,
                                            width: width/3.6,
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(top: height/94.25),
                                              child: Text(
                                                "Register",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.sofiaSans(
                                                    fontSize: 16,
                                                    color: textColor.withOpacity(.7),
                                                    fontWeight: FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height/75.4,
                                        ),
                                        /*     Padding(
                                          padding: EdgeInsets.only(right: width/2.3),
                                          child: Text(
                                            data["date"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 16,
                                                color: TextColor.withOpacity(.5),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height/75.4,
                                        ),*/
                                        Row(
                                          children: [
                                            Padding(
                                              padding:EdgeInsets.only(left: width/24),
                                              child: Container(
                                                width: width/1.16,
                                                child: ReadMoreText(
                                                  data["description"],

                                                  trimMode: _trimMode,
                                                  trimLines: _trimLines,
                                                  trimLength: _trimLength,
                                                  //isCollapsed: isCollapsed,
                                                  style:
                                                  GoogleFonts.sofiaSans(color: TextColor),
                                                  colorClickableText: primaryColor,
                                                  trimCollapsedText: 'Read more',
                                                  trimExpandedText: ' Less',
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(top: height/15.08),
                                              child: InkWell(
                                                onTap: () {
                                                  Share.share(
                                                      'check out my website https://example.com',
                                                      subject: 'Look what I made!');
                                                },
                                                child: Icon(
                                                  Icons.share,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.grey.withOpacity(.3),
                                          endIndent: 10,
                                          indent: 10,
                                        ),

                                      ],
                                    ),
                                  ),
                                ): SizedBox();
                              }
                              return LoadingState();
                            }
                        );
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
