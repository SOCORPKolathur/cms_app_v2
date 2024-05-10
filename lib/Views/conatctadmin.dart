import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms_app_v2/Widgets/kText.dart';
import 'package:cms_app_v2/Widgets/nodata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../Widgets/loading.dart';
import '../constant.dart';
import 'package:intl/intl.dart';

class ContactAdmin extends StatefulWidget {
  String userphone;
  String username;
  String userid;
  ContactAdmin({required this.userphone,required this.username,required this.userid});

  @override
  State<ContactAdmin> createState() => _ContactAdminState();
}

class _ContactAdminState extends State<ContactAdmin> {

  var _trimMode = TrimMode.Line;
  int _trimLines = 3;
  int _trimLength = 240;

  int today = 0;
  int upcomming =0;



  getdoccount() async {
    var docu = await FirebaseFirestore.instance.collection("Tickets").where("phone",isEqualTo: widget.userphone).get();
    setState(() {
      today = docu.docs.length;
    });

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
          "Contact Admin",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Lottie.asset('assets/conatctadmin.json')),
          SizedBox(height: height / 87.7,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap:(){
                    _showAlertDialogOne();
                    },
                  child: Material(
                    elevation: 4,
                  borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("Raise a Ticket", style: GoogleFonts.sofiaSans(
                      fontSize: 22, color: textColor, fontWeight: FontWeight.w800),
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 57.7, left: width / 18),
            child: Text(
              "Your Previous tickets",
              style: GoogleFonts.sofiaSans(
                color: TextColor,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width / 18,
            ),
            child: Container(
              width: width / 0.9,
              child: Text(
                "Connect with admin and your issues will be solved as top priority",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.5),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xFF262626).withOpacity(
                .2),
            endIndent: 15,
            indent: 15,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Tickets").orderBy("timestamp",descending: true).snapshots(),
            builder: (context,snapshot){
              if(today>0) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        if (snapshot.hasData) {
                          var data = snapshot.data!.docs[index];

                          return data["phone"] == widget.userphone ?
                          Container(
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
                                    data["reason"],
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
                                    data["message"],
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

                                      top: height / 75.4,
                                      right: width / 30,
                                      left: width / 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            color: Colors.yellow.withOpacity(
                                                0.40)
                                        ),
                                        child: Center(
                                          child: Text("Pending",
                                            style: GoogleFonts.sofiaSans(
                                                fontSize: 16,
                                                color: Colors.black.withOpacity(
                                                    0.70),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),),

                                      Text(
                                        "Raised at ${data["time"]} - ${data["date"]}",
                                        style: GoogleFonts.sofiaSans(
                                            fontSize: 14,
                                            color: Color(0xFF262626)
                                                .withOpacity(.7),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
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
                          ) : SizedBox();
                        }
                        return LoadingState();
                      }
                  );
                }
              }
              return Container(
                  height:200,
                child: Nodata(),
              );
            },
          )
        ],
      ),
    );
  }
  TextEditingController reason = new TextEditingController();
  TextEditingController message = new TextEditingController();
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
          title: KText(text:
          'Raise a ticket',
            style: GoogleFonts.sofiaSans(),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      height: height / 15.08,
                      child: Image.asset("assets/Requirement.png"),
                    ),
                    KText(text:
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
                  width: width / 1.56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: TextColor,
                    ),
                  ),
                  child: TextField(
                    controller: reason,
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
                      height: height / 18.85,
                      child: Image.asset("assets/Playlist.png"),
                    ),
                    KText(text:
                    "Message :",
                      style: GoogleFonts.sofiaSans(
                        color: TextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width / 1.56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: TextColor,
                    ),
                  ),
                  child: TextField(
                    maxLines: 3,
                    controller: message,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: GoogleFonts.sofiaSans(
                            color: Color(0xff262626).withOpacity(.3))),
                  ),
                ),
                SizedBox(
                  height: height / 37.7,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: height / 18.85,
                        width: width / 2.76,
                        decoration: BoxDecoration(
                            color: Color(0xffFF2020),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: KText(text:
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
                      width: width / 36,
                    ),
                    InkWell(
                      onTap: (){
                        FirebaseFirestore.instance.collection("Tickets").doc().set({
                          "reason":reason.text,
                          "message":message.text,
                          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                          "time":"${DateTime.now().hour} : ${DateTime.now().minute}",
                          "timestamp":DateTime.now().millisecondsSinceEpoch,
                          "username": widget.username,
                          "phone": widget.userphone,
                          "userid":widget.userid,
                          "view":false,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your ticked is received will update you shortly.")));
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: height / 18.85,
                        width: width / 2.76,
                        decoration: BoxDecoration(
                            color: Color(0xff00A05A),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: KText(text:
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
}
