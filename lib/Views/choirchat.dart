import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../constant.dart';



class ChoirChat extends StatefulWidget {
  ChoirChat({required this.userDocId, required this.uid, required this.collection, required this.title, required this.isClan,required this.clanId, required this.isCommittee,required this.committeeId});
  final String userDocId;
  String title;
  final String uid;
  final String collection;
  final String clanId;
  final bool isClan;
  final String committeeId;
  final bool isCommittee;

  @override
  State<ChoirChat> createState() => _ChoirChatState();
}

class _ChoirChatState extends State<ChoirChat> {
  ScrollController _scrollController = new ScrollController();

  TextEditingController chatMessage = new TextEditingController();
  var currentUser;
  setCurrentUser(var user){
    currentUser = user;
  }
  String userid="";
  String username="User";
  String userlastname="User";
  getuser() async {
    var document = await FirebaseFirestore.instance.collection('Users').where('id',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username=document.docs[0]["firstName"];
      userlastname=document.docs[0]["lastName"];
      userid=document.docs[0].id;
    });

  }

  @override
  void initState() {
    getuser();
    //toplaynotification();
    // TODO: implement initState
    super.initState();
  }
  int count= 0;
  toplaynotification(){
    CollectionReference reference = FirebaseFirestore.instance.collection(widget.collection);
    reference.snapshots().listen((querySnapshot) {
      print("Hello++++++++++++++++++++++++++++++++++++++++++++");
      setState(() {
        count=count+1;
      });
      if(count>1){
        print("Ok");
        //FlutterRingtonePlayer().playNotification(looping: false,);
      }

    });

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
          widget.title,
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: /*widget.isCommittee
                  ? FirebaseFirestore.instance
                  .collection('CommitteeChat').doc(widget.committeeId).collection('Chat')
                  .orderBy("time")
                  .snapshots()
                  : widget.isClan
                  ? FirebaseFirestore.instance
                  .collection('ClansChat').doc(widget.clanId).collection('Chat')
                  .orderBy("time")
                  .snapshots()
                  :*/ FirebaseFirestore.instance
            .collection(widget.collection)
            .orderBy("time")
            .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Container(
              height: MediaQuery.of(context).size.height/1.2,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: height / 37.95, horizontal: width / 19.6),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      reverse: true,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: snapshot.data!.docs[index]["sender"]=="${username} ${userlastname!}" ?CrossAxisAlignment.end: CrossAxisAlignment.start,
                              children: [
                                VisibilityDetector(
                                    key: Key('my-widget-key2 $index'),
                                    onVisibilityChanged: (VisibilityInfo visibilityInfo){
                                      var visiblePercentage = visibilityInfo.visibleFraction;

                                      if(visiblePercentage>0.50){

                                        FirebaseFirestore.instance.collection(widget.collection).doc(snapshot.data!.docs[index].id).update(
                                            {
                                              "views":FieldValue.arrayUnion([userid]),
                                            }
                                        );
                                      }
                                    },
                                    child: messageTile(Size(width, height), snapshot.data!.docs[index].data(), context, snapshot.data!.docs[index].id,)),
                                snapshot.data!.docs[index]["submitdate"] == "${DateTime.now().year}-${ DateTime.now().month}-${ DateTime.now().day}" ?
                                Text(
                                  'Today  ${snapshot
                                      .data!
                                      .docs[index]["submittime"]}',
                                  style: TextStyle(
                                      fontSize: width /
                                          40,
                                      color: Colors
                                          .grey,
                                      fontWeight: FontWeight
                                          .w700),)
                                    :
                                snapshot
                                    .data!
                                    .docs[index]["submitdate"] ==
                                    "${DateTime
                                        .now()
                                        .year}-${ DateTime
                                        .now()
                                        .month}-${ DateTime
                                        .now()
                                        .day -
                                        1}"
                                    ?
                                Text(
                                  'Yesterday  ${snapshot
                                      .data!
                                      .docs[index]["submittime"]}',
                                  style: TextStyle(
                                      fontSize: width /
                                          40,
                                      color: Colors
                                          .grey,
                                      fontWeight: FontWeight
                                          .w700),)
                                    :
                                Text(
                                  "${snapshot
                                      .data!
                                      .docs[index]["submitdate"]}  ${snapshot
                                      .data!
                                      .docs[index]["submittime"]}",
                                  style: TextStyle(
                                      fontSize: width /
                                          40,
                                      color: Colors
                                          .grey,
                                      fontWeight: FontWeight
                                          .w700),),
                                Text(
                                  '${snapshot
                                      .data!
                                      .docs[index]["sender"]}',
                                  style: TextStyle(
                                      fontSize: width /
                                          40,
                                      color: Colors
                                          .grey,
                                      fontWeight: FontWeight
                                          .w700),),
                                SizedBox(
                                  height: height /
                                      80,)
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: height / 10.18,
                    )
                  ],
                ),
              ),
            );
          }return Container();
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: height / 15,
        width: double.infinity,
        child: SizedBox(
          height: height / 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                height: height / 18,
                width: width * 0.8,
                child: TextField(
                  controller: chatMessage,
                  onEditingComplete: (){ onSendMessag(currentUser);},
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      hintText: "Type here",
                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.send,color:primaryColor),
                  onPressed:(){ onSendMessag(currentUser);}
              ),
            ],
          ),
        ),

      ),

      // bottomNavigationBar: Container(
      //   height: height / 9.42,
      //   width: double.infinity,
      //   child: Padding(
      //     padding: EdgeInsets.only(bottom: height / 37.7),
      //     child: Row(
      //       children: [
      //         // Padding(
      //         //   padding: EdgeInsets.only(left: width / 36),
      //         //   child: Icon(
      //         //     Icons.attachment,
      //         //     size: 30,
      //         //   ),
      //         // ),
      //         Padding(
      //           padding: EdgeInsets.only(left: width / 24),
      //           child: Container(
      //             width: width / 1.28,
      //             height: height / 15.08,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 border: Border.all(color: TextColor.withOpacity(.3))),
      //             child: Padding(
      //               padding: EdgeInsets.only(
      //                 left: width / 18,
      //               ),
      //               child: TextFormField(
      //                 keyboardType: TextInputType.phone,
      //                 maxLength: 10,
      //                 decoration: InputDecoration(
      //                     border: InputBorder.none,
      //                     contentPadding: EdgeInsets.only(
      //                       top: height / 41.88,
      //                     ),
      //                     hintText: 'Send a message',
      //                     counter: SizedBox(),
      //                     suffixIcon: IconButton(
      //                       onPressed: () {},
      //                       icon: Padding(
      //                         padding: EdgeInsets.only(top: height / 75.4),
      //                         child: Icon(
      //                           Icons.camera_alt,
      //                           color: TextColor.withOpacity(.3),
      //                         ),
      //                       ),
      //                     ),
      //                     hintStyle: GoogleFonts.sofiaSans(
      //                         color: Color(0xff262626).withOpacity(.3))),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           width: width / 72,
      //         ),
      //         CircleAvatar(
      //           backgroundColor: primaryColor,
      //           radius: 25,
      //           child: Icon(
      //             Icons.send,
      //             color: textColor,
      //           ),
      //         )
      //         // Padding(
      //         //   padding: EdgeInsets.only(left: width / 72),
      //         //   child: Container(
      //         //     height: height / 15.08,
      //         //     child: Image.asset("assets/Group 57.png"),
      //         //   ),
      //         // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
  Widget messageTile(Size size, chatMap,BuildContext context, id) {
    double width = MediaQuery.of(context).size.width;
    return Builder(builder: (_) {
      if (chatMap['type'] == "text") {
        return
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
                width: size.width,
                alignment:  chatMap['sender']== "${username} ${userlastname}"? Alignment.centerRight: Alignment.centerLeft,
                child:
                GestureDetector(
                  onLongPress: () {
                    showDialog(context: context, builder: (ctx) =>
                        AlertDialog(
                          title: const Text('Are you sure delete this message'),
                          actions: [
                            TextButton(onPressed: () {
                              if(chatMap['sender']== "${username} ${userlastname}"){
                                if(widget.isClan) {
                                  FirebaseFirestore.instance.collection("ClansChat").doc(widget.clanId).collection('Chat').doc(id).delete();
                                }else if(widget.isCommittee){
                                  FirebaseFirestore.instance.collection("CommitteeChat").doc(widget.committeeId).collection('Chat').doc(id).delete();
                                }else{
                                  FirebaseFirestore.instance.collection(widget.collection).doc(id).delete();
                                }
                              }
                              Navigator.pop(context);
                            }, child: const Text('Delete'))
                          ],
                        ));
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8, horizontal: 14),
                      margin: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 0),
                      decoration: BoxDecoration(
                        color:  chatMap['sender']=="${username} ${userlastname}"? Colors.white: primaryColor,
                        border: Border.all(color: chatMap['sender']=="${username} ${userlastname}"? primaryColor
                            .withOpacity(0.65) : primaryColor),
                        borderRadius: BorderRadius.only(topLeft: Radius
                            .circular(15),
                          bottomLeft: chatMap['sender']=="${username} ${userlastname}"? Radius.circular(15) : Radius.circular(0),
                          bottomRight: chatMap['sender']=="${username} ${userlastname}"? Radius.circular(0) : Radius.circular(15),
                          topRight: Radius.circular(15),),
                      ),
                      child: Column(
                        children: [
                          Text(
                            chatMap['message'],
                            style: GoogleFonts.montserrat(
                              fontSize: width/30.15384615,
                              fontWeight: FontWeight.w500,
                              color: chatMap['sender']=="${username} ${userlastname}"? Colors.black : Colors.white,
                            ),
                          ),
                        ],
                      )),
                )
            ),
          );
      }
      else {
        return SizedBox();
      }
    });
  }

  void onSendMessag(var user) async {
    String messageText = '';
    messageText = chatMessage.text;
    if (chatMessage.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "message": chatMessage.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
        "submittime":"${DateFormat('hh:mm a').format(DateTime.now())}",
        "sender": "${username} ${userlastname}",
        "submitdate":"${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
        "views":[userid],
      };
      chatMessage.clear();
      if(widget.isClan){
        await FirebaseFirestore.instance.collection("ClansChat").doc(widget.clanId).collection('Chat').add(messages);
      }else if(widget.isCommittee){
        await FirebaseFirestore.instance.collection("CommitteeChat").doc(widget.committeeId).collection('Chat').add(messages);
      }else{
        await FirebaseFirestore.instance.collection(widget.collection).add(messages);
      }
      await sendNotification(messageText);
      messageText = '';
    }
    else {
      print("Enter Some Text");
    }
  }

  sendNotification(String message) async {
    var users = await FirebaseFirestore.instance.collection('Users').where('id',isNotEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    var members = await FirebaseFirestore.instance.collection('Members').get();
    var choruses = await FirebaseFirestore.instance.collection('Chorus').get();
    var clans = await FirebaseFirestore.instance.collection('Clans').get();
    for(int i=0;i<users.docs.length;i++){
      print(users.docs[i]["phone"]);
      sendPushMessage(users.docs[i]["fcmToken"]);
    }
  }


  Future<bool> sendPushMessage(String token) async {
    bool isSended = false;
    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          'key=${apiKeyForNotification}',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': chatMessage.text, 'title': "New Message from ${widget.title}"},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSended = true;
      } else {
        isSended = false;
      }
    } catch (e) {
      print("error push notification");
    }
    return isSended;
  }
}
