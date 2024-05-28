import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms_app_v2/Views/choirchat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/chatscreen.dart';
import 'package:cms_app_v2/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  String userid="";
  String username="User";
  getuser() async {
    var document = await FirebaseFirestore.instance.collection('Users').where('id',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username=document.docs[0]["firstName"];
      userid=document.docs[0].id;
    });

  }


  String churchLogo = "";
  getchurchlogo() async {
    var church = await FirebaseFirestore.instance.collection('ChurchDetails').get();
    churchLogo = church.docs.first.get("logo");
  }

  @override
  void initState() {
    getuser();
    getchurchlogo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Connect",
          style: GoogleFonts.sofiaSans(
            color: textColor,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("ChurchChat")
                .orderBy("time",descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int count = snapshot.data!.docs.where((doc) {
                  List<dynamic> array = doc['views'];
                  return !array.contains(userid);
                }).length;
                return ListTile(
                  onTap: () {
                    print(userid);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>
                            ChatScreen(
                                title: "Church Group",
                                userDocId: userid,
                                uid: FirebaseAuth.instance.currentUser!.uid,
                                collection: "ChurchChat",
                                isClan: false,
                                clanId: "",
                                committeeId: "",
                                isCommittee: false))
                    );
                  },
                  leading: Padding(
                    padding: EdgeInsets.only(left: width / 36),
                    child: Container(
                      height: height / 15.08,
                      width: width/7.84,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                          child: Image.network(churchLogo,fit: BoxFit.cover,)),
                    ),
                  ),
                  title: Text(
                    "Church Group",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    snapshot.data!.docs[0]["message"],
                    style: GoogleFonts.sofiaSans(
                      color: TextColor.withOpacity(.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                count>0?  Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius
                                          .circular(50)
                                  ),
                                  child: Center(
                                    child: Text(
                                      count
                                          .toString(),
                                      style: GoogleFonts.sofiaSans(
                                        color: textColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                  ),

                                ) : Container(width: 10,height: 10,),
                                Text(
                                  snapshot.data!.docs[0]["submittime"],
                                  style: GoogleFonts.sofiaSans(
                                    color: TextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),



                );
              }
              return ListTile(
                onTap: () {
                  print(userid);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          ChatScreen(
                              title: "Church Group",
                              userDocId: userid,
                              uid: FirebaseAuth.instance.currentUser!.uid,
                              collection: "ChurchChat",
                              isClan: false,
                              clanId: "",
                              committeeId: "",
                              isCommittee: false))
                  );
                },
                leading: Padding(
                  padding: EdgeInsets.only(left: width / 36),
                  child: Container(
                    height: height / 15.08,
                    child: Image.asset("assets/holy_church.png"),
                  ),
                ),
                title: Text(
                  "Church Group",
                  style: GoogleFonts.sofiaSans(
                    color: TextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: Text(
                  "",
                  style: GoogleFonts.sofiaSans(
                    color: TextColor.withOpacity(.4),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),

              );
            }
          ),
          SizedBox(
            width: width/1.02,
            child: Divider(
              color: Color(0xff262626).withOpacity(.1),
            ),
          ),
          ListTile(
            onTap: (){
              /*Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ChatScreen("Chennai Zone"))
              );*/
            },
            leading: Padding(
              padding:  EdgeInsets.only(left: width/36),
              child: Container(
                height: height/15.08,
                child: Image.asset("assets/Mask group (13).png"),
              ),
            ),
            title: Text(
              "Chennai Zone",
              style: GoogleFonts.sofiaSans(
                color: TextColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: Text(
              "Task completed",
              style: GoogleFonts.sofiaSans(
                color: TextColor.withOpacity(.4),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            trailing: Text(
              "08:42 Am",
              style: GoogleFonts.sofiaSans(
                color: TextColor,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            width: width/1.02,
            child: Divider(
              color: Color(0xff262626).withOpacity(.1),
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("ChorusChat")
                .orderBy("time",descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
      int count = snapshot.data!.docs.where((doc) {
        List<dynamic> array = doc['views'];
        return !array.contains(userid);
      }).length;
      return ListTile(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>
                  ChoirChat(
                      title: "Choir Group",
                      userDocId: userid,
                      uid: FirebaseAuth.instance.currentUser!.uid,
                      collection: "ChorusChat",
                      isClan: false,
                      clanId: "",
                      committeeId: "",
                      isCommittee: false)));
        },
        leading: Padding(
          padding: EdgeInsets.only(left: width/36),
          child: Container(
            height: height/15.08,
            child: Image.asset("assets/Mask group (14).png"),
          ),
        ),
        title: Text(
          "Choir Group",
          style: GoogleFonts.sofiaSans(
            color: TextColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          snapshot.data!.docs[0]["message"],
          style: GoogleFonts.sofiaSans(
            color: TextColor.withOpacity(.4),
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            count>0?  Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius
                      .circular(50)
              ),
              child: Center(
                child: Text(
                  count
                      .toString(),
                  style: GoogleFonts.sofiaSans(
                    color: textColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),),
              ),

            ) : Container(width: 10,height: 10,),
            Text(
              snapshot.data!.docs[0]["submittime"],
              style: GoogleFonts.sofiaSans(
                color: TextColor,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      );
    }
              return ListTile(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          ChoirChat(
                              title: "Choir Group",
                              userDocId: userid,
                              uid: FirebaseAuth.instance.currentUser!.uid,
                              collection: "ChorusChat",
                              isClan: false,
                              clanId: "",
                              committeeId: "",
                              isCommittee: false)));
                },
                leading: Padding(
                  padding: EdgeInsets.only(left: width/36),
                  child: Container(
                    height: height/15.08,
                    child: Image.asset("assets/Mask group (14).png"),
                  ),
                ),
                title: Text(
                  "Choir Group",
                  style: GoogleFonts.sofiaSans(
                    color: TextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),

              );
            }
          ),
          SizedBox(
            width: width/1.02,
            child: Divider(
              color: Color(0xff262626).withOpacity(.1),
            ),
          ),
        /*  ListTile(
            onTap: (){
            */
          /*  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ChatScreen("Blood requirements"))
              );*/
          /*
            },
            leading: Padding(
              padding: EdgeInsets.only(left: width/36),
              child: Container(
                height: height/15.08,
                child: Image.asset("assets/image 14.png"),
              ),
            ),
            title: Text(
              "Blood requirement",
              style: GoogleFonts.sofiaSans(
                color: TextColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: Text(
              "Urgent B+ needed",
              style: GoogleFonts.sofiaSans(
                color: TextColor.withOpacity(.4),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            trailing: Text(
              "02:15 Pm",
              style: GoogleFonts.sofiaSans(
                color: TextColor,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),*/
          SizedBox(
            width: width/1.02,
            child: Divider(
              color: Color(0xff262626).withOpacity(.1),
            ),
          ),
       /*   ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: width/36),
              child: Container(
                height: height/15.08,
                child: Image.asset("assets/holy_church.png"),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Church",
                style: GoogleFonts.sofiaSans(
                  color: TextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text(
                "Hello !",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.4),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            trailing: Text(
              "02:15 Am",
              style: GoogleFonts.sofiaSans(
                color: TextColor,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
