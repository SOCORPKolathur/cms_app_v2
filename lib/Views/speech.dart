import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Widgets/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';

import '../Widgets/nodata.dart';
import '../constant.dart';

class SpeechScreen extends StatefulWidget {
  String phone;
   SpeechScreen({required this.phone});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  var _trimMode = TrimMode.Line;
  int _trimLines = 2;
  int _trimLength = 240;

  String obj = "Today";
  int today = 0;
  int upcomming =0;



  getdoccount() {
    Future.wait([gettodaycount(), getupcommingcount()]).then((List<int> counts) {
      setState(() {
        today = counts[0];
        upcomming = counts[1];
        print(today);
        print(upcomming);
      });
    });
  }

  Future<int> gettodaycount() async {
    CollectionReference col1 = FirebaseFirestore.instance.collection('Speeches');
    final snapshots = await col1.get();
    int count = snapshots.docs.where((doc) => doc["lastName"] == widget.phone && doc["Date"] ==  DateFormat('dd/MM/yyyy').format(DateTime.now())).length;
    return count;
  }

  Future<int> getupcommingcount() async {
    CollectionReference col1 = FirebaseFirestore.instance.collection('Speeches');
    final snapshots = await col1.get();
    int count = snapshots.docs.where((doc) => doc["lastName"] == widget.phone && doc["Date"] !=  DateFormat('dd/MM/yyyy').format(DateTime.now())).length;
    return count;
  }

  @override
  void initState() {
    getdoccount();
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
          "My Speech",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: DefaultTabController(
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
                        "All Speeches",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: obj == "All Speeches"
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
                  today>0?
              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("Speeches").orderBy("timestamp",descending: true).snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index) {
                        if(snapshot.data!.docs.length==0){
                          return Nodata();
                        }
                        if(snapshot.hasData) {
                          var data = snapshot.data!.docs[index];
                          return data["lastName"] == widget.phone && data['Date'] == DateFormat('dd/MM/yyyy').format(DateTime.now()).toString() ? Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height/25.13,
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
                                      data["Date"],
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 16,
                                          color: TextColor.withOpacity(.5),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      width: width/3.14,
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
                                      data["Time"],
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 16,
                                          color: TextColor.withOpacity(.5),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height/75.4,
                                ),
                                /*   Padding(
                            padding:  EdgeInsets.only(right: width/1.8),
                            child: Text(
                              "Speech Title",
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 20,
                                  color: TextColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: height/75.4,
                          ),*/

                                Padding(
                                  padding: EdgeInsets.only(left: width/24),
                                  child: Container(
                                    width: width/1.16,
                                    child: ReadMoreText(
                                      data["speech"],

                                      trimMode: _trimMode,
                                      trimLines: _trimLines,
                                      trimLength: _trimLength,
                                      //isCollapsed: isCollapsed,
                                      style: GoogleFonts.sofiaSans(color: TextColor),
                                      colorClickableText: primaryColor,
                                      trimCollapsedText: 'Read more',
                                      trimExpandedText: ' Less',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/75.4,
                                ),
                                Divider(
                                  color: Colors.grey.withOpacity(.3),
                                  endIndent: 10,
                                  indent: 10,
                                ),

                              ],
                            ),
                          ) :SizedBox();
                        }

                        return LoadingState();
                      }
                  );
                }
            ) : Nodata(),
                  upcomming>0?
                  StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("Speeches").orderBy("timestamp",descending: true).snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index) {
                              if(snapshot.data!.docs.length==0){
                                return Nodata();
                              }
                              if(snapshot.hasData) {
                                var data = snapshot.data!.docs[index];
                                return data["lastName"] == widget.phone && data['Date'] != DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()? Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height/25.13,
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
                                            data["Date"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 16,
                                                color: TextColor.withOpacity(.5),
                                                fontWeight: FontWeight.w800),
                                          ),
                                          SizedBox(
                                            width: width/3.14,
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
                                            data["Time"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 16,
                                                color: TextColor.withOpacity(.5),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height/75.4,
                                      ),
                                      /*   Padding(
                            padding:  EdgeInsets.only(right: width/1.8),
                            child: Text(
                              "Speech Title",
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 20,
                                  color: TextColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: height/75.4,
                          ),*/

                                      Padding(
                                        padding: EdgeInsets.only(left: width/24),
                                        child: Container(
                                          width: width/1.16,
                                          child: ReadMoreText(
                                            data["speech"],

                                            trimMode: _trimMode,
                                            trimLines: _trimLines,
                                            trimLength: _trimLength,
                                            //isCollapsed: isCollapsed,
                                            style: GoogleFonts.sofiaSans(color: TextColor),
                                            colorClickableText: primaryColor,
                                            trimCollapsedText: 'Read more',
                                            trimExpandedText: ' Less',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height/75.4,
                                      ),
                                      Divider(
                                        color: Colors.grey.withOpacity(.3),
                                        endIndent: 10,
                                        indent: 10,
                                      ),

                                    ],
                                  ),
                                ) :SizedBox();
                              }

                              return LoadingState();
                            }
                        );
                      }
                  ): Nodata(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
