import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Widgets/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../constant.dart';

class Podcasts extends StatefulWidget {
  String userphone;
  Podcasts({required this.userphone});

  @override
  State<Podcasts> createState() => _PodcastsState();
}

class _PodcastsState extends State<Podcasts> {
  String obj = "Today";
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
          "Podcasts",
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
                          "Audio Podcasts",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: obj == "Audio Podcasts"
                                  ? textColor.withOpacity(.7)
                                  : TextColor.withOpacity(.4),
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
                          "Video Ceremonies",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: obj == "Video Ceremonies"
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
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("AudioPodcasts").orderBy("timestamp",descending: true).snapshots(),
                      builder: (context,snapshot){
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.docs[index];
                                return
                                VisibilityDetector(
                                  key: Key('my-widget-key2 $index'),
                                  onVisibilityChanged: (VisibilityInfo visibilityInfo){
                                    print(visibilityInfo.visibleFraction);
                                    var visiblePercentage = visibilityInfo.visibleFraction;
                                    if(visiblePercentage>0.50){
                                      FirebaseFirestore.instance.collection("AudioPodcasts").doc(data.id).update(
                                          {
                                            "view":FieldValue.arrayUnion([widget.userphone]),
                                          }
                                      );
                                    }
                                  },
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height / 37.7, left: width / 36, right: width / 36),
                                          child: Container(
                                            width:width/1,
                                            height: height/4,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),

                                                child: Image.network(data["thumbUrl"],fit: BoxFit.cover,)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width / 18, top: height / 4.71),
                                          child: Text(
                                            data["title"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 18,
                                                color: textColor,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width / 18, top: height / 4.18),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.mic,
                                                size: 12,
                                                color: textColor,
                                              ),
                                              Text(
                                               data["vocal"],
                                                style: GoogleFonts.sofiaSans(
                                                    fontSize: 12,
                                                    color: textColor.withOpacity(.6),
                                                    fontWeight: FontWeight.w800),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width / 1.28, top: height / 5.3),
                                          child: Icon(
                                            Icons.play_circle,
                                            size: 60,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return LoadingState();
                            }
                        );
                      },
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("VideoGallery")/*.orderBy("timestamp",descending: true)*/.snapshots(),
                      builder: (context,snapshot){
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.docs[index];
                                return
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height / 37.7, left: width / 36, right: width / 36),
                                      child: Container(
                                        width:width/1,
                                        height: height/4,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),

                                            child: Image.network(data["thumbUrl"],fit: BoxFit.cover,)),
                                      ),
                                    ),
                                  /*  Padding(
                                      padding: EdgeInsets.only(
                                          left: width / 18, top: height / 4.71),
                                      child: Text(
                                        data["title"],
                                        style: GoogleFonts.sofiaSans(
                                            fontSize: 18,
                                            color: textColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width / 18, top: height / 4.18),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.mic,
                                            size: 12,
                                            color: textColor,
                                          ),
                                          Text(
                                           data["vocal"],
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 12,
                                                color: textColor.withOpacity(.6),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),*/
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width / 1.28, top: height / 5.3),
                                      child: Icon(
                                        Icons.play_circle,
                                        size: 60,
                                        color: textColor,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return LoadingState();
                            }
                        );
                      },
                    ),





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
