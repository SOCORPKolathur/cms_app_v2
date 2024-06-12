import 'dart:math';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Widgets/loading.dart';
import 'package:cms_app_v2/Widgets/nodata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../constant.dart';

class MyPrayer extends StatefulWidget {
  String phone;
  String firstname;
  String lastname;
   MyPrayer({required this.phone,required this.firstname,required this.lastname});

  @override
  State<MyPrayer> createState() => _MyPrayerState();
}

class _MyPrayerState extends State<MyPrayer> {

  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();

  _showAlertDialogOne() {
    return showDialog<void>(
      context: context,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return AlertDialog(
          backgroundColor: Color(0xffFFFFFF),
          insetPadding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          surfaceTintColor: Colors.transparent,
          title: Text(
            'Send Prayer Request',
            style: GoogleFonts.sofiaSans(
              color: TextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      height: height/15.08,
                      child: Image.asset("assets/Requirement.png"),
                    ),
                    Text(
                      "Reason :",
                      style: GoogleFonts.sofiaSans(
                        color: TextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width/1.56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: TextColor,
                    ),
                  ),
                  child: TextField(
                    controller: title,

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: GoogleFonts.sofiaSans(
                            color: Color(0xff262626).withOpacity(.3))),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: height/18.85,
                      child: Image.asset("assets/Playlist.png"),
                    ),
                    Text(
                      "Description :",
                      style: GoogleFonts.sofiaSans(
                        color: TextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width/1.56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: TextColor,
                    ),
                  ),
                  child: TextField(
                    maxLines: 3,
                      controller: description,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: GoogleFonts.sofiaSans(
                            color: Color(0xff262626).withOpacity(.3))),
                  ),
                ),
                SizedBox(
                  height: height/37.7,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height:height/18.85,
                        width: width/2.76,
                        decoration: BoxDecoration(
                            color: Color(0xffFF2020),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.sofiaSans(
                              color: textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width/36,
                    ),
                    InkWell(
                      onTap: (){
                        if (title.text != "" && description.text != "") {
                          String docId = getRandomString(16);
                          FirebaseFirestore.instance.collection('Prayers').doc(docId).set(
                              {
                                "id" : docId,
                                "date" : DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                "time" : DateFormat('hh:mm a').format(DateTime.now()),
                                "title" : title.text,
                                "description" : description.text,
                                "timestamp" : DateTime.now().millisecondsSinceEpoch,
                                "status" : "Pending",
                                "requestedBy": "${widget.firstname} ${widget.lastname}",
                                "phone" : widget.phone
                              }
                          ).whenComplete(() async {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Prayer requested successfully")));
                            setState(() {
                              description.text = "";
                              title.text = "";
                            });
                            getdoccount();
                            Navigator.pop(context);
                          }).catchError((e) async {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to create Prayer request")));

                          });
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Prayer tile and description cannot be empty")));
                        }
                      },
                      child: Container(
                        height:height/18.85,
                        width: width/2.76,
                        decoration: BoxDecoration(
                            color: Color(0xff00A05A),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.sofiaSans(
                              color: textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }



  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
    CollectionReference col1 = FirebaseFirestore.instance.collection('Prayers');
    final snapshots = await col1.get();
    int count = snapshots.docs.where((doc) => doc["phone"] == widget.phone && doc["date"] ==  DateFormat('dd-MM-yyyy').format(DateTime.now())).length;
    return count;
  }

  Future<int> getupcommingcount() async {
    CollectionReference col1 = FirebaseFirestore.instance.collection('Prayers');
    final snapshots = await col1.get();
    int count = snapshots.docs.where((doc) => doc["phone"] == widget.phone && doc["date"] !=  DateFormat('dd-MM-yyyy').format(DateTime.now())).length;
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
          "My Prayer",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width/36),
            child: InkWell(
              onTap: (){
                _showAlertDialogOne();
              },
              child: Container(
                height: height/18.85,
                width: width/3.87,
                decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width/36),
                      child: Text(
                        "Add",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sofiaSans(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Icon(
                          Icons.add,
                          size: 25,
                          color: primaryColor,
                        ),
                  ],
                ),
              ),
            ),
          )
        ],
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
                        "All Prayers",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: obj == "All Prayers"
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
                      stream: FirebaseFirestore.instance.collection("Prayers").orderBy("timestamp",descending: true).snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index) {
                              if(snapshot.data!.docs.length==0){
                                return Nodata();
                              }
                              if(snapshot.hasData) {
                                var data = snapshot.data!.docs[index];
                                return data["phone"] == widget.phone && data['date'] == DateFormat('dd-MM-yyyy').format(DateTime.now()).toString()?Container(
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
                                      Row(
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
                                                color: data["status"] == "Approved" ?
                                                Color(0xff00A15B).withOpacity(.2) :
                                                data["status"] == "Denied" ?
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
                                                    color: data["status"] == "Approved" ?
                                                    Color(0xff00A15B) :
                                                    data["status"] == "Denied" ?
                                                    Colors.red :
                                                    Colors.orange,
                                                    fontWeight: FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "You request by ${data['time']} - ${data['date']}",
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
                                ) :SizedBox();
                              }

                              return LoadingState();
                            }
                        );
                      }
                  ) : Nodata(),
                  upcomming>0?
                  StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("Prayers").orderBy("timestamp",descending: true).snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index) {
                              if(snapshot.data!.docs.length==0){
                                return Nodata();
                              }
                              if(snapshot.hasData) {
                                var data = snapshot.data!.docs[index];
                                return data["phone"] == widget.phone && data['date'] != DateFormat('dd-MM-yyyy').format(DateTime.now()).toString()?
                                Container(
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
                                      Row(
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
                                                color: data["status"] == "Approved" ?
                                                Color(0xff00A15B).withOpacity(.2) :
                                                data["status"] == "Denied" ?
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
                                                    color: data["status"] == "Approved" ?
                                                    Color(0xff00A15B) :
                                                    data["status"] == "Denied" ?
                                                    Colors.red :
                                                    Colors.orange,
                                                    fontWeight: FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "You request by ${data['time']} - ${data['date']}",
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
