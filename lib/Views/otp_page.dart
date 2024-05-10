import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/otp_page.dart';
import 'package:cms_app_v2/Views/register_screen.dart';
import 'package:cms_app_v2/Views/sign_in_page.dart';
import 'package:flutterotpfield/flutterotpfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';

import '../constant.dart';
import 'home_page.dart';

class OtpPage extends StatefulWidget {
  String phone;
   OtpPage({required this.phone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otp = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    // getUserLocation();
    gettoken();
    _verifyphone();
  }
  var _verificationCode;

  _verifyphone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phone}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              var document = await FirebaseFirestore.instance.collection('Users').get();
              for (int i = 0; i < document.docs.length; i++) {
                if (document.docs[i]['phone'] == widget.phone) {
                  FirebaseFirestore.instance.collection('Users').doc(
                      document.docs[i].id).update({
                    "id": value.user!.uid,
                    "fcmToken": fcmToken
                  });
                  setState(() {
                    //userId = document.docs[i].id;
                  });
                }
              }
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Logged In Successfully"))
              );

            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verificationid, int? resendtoken) {
          setState(() {
            _verificationCode = verificationid;
          });
        },
        codeAutoRetrievalTimeout: (String verificationid) {
          setState(() {
            _verificationCode = verificationid;
          });
        },
        timeout: Duration(seconds: 120));
  }
  String fcmToken="";
  gettoken() async {
    String? fcmTokenk = await FirebaseMessaging.instance.getToken();
    fcmToken=fcmTokenk!;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.asset("assets/vec1.png"),
                    ),

                  ],
                ),
                SizedBox(
                  height: height / 25.13,
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Verify Mobile Number",
                    style: GoogleFonts.openSans(
                        color: Color(0xff006BA6),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 36),
                  child: Text(
                    "We have you sent to SMS with 6 digit\nverification code (OTP) on",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        color: Color(0xff262626).withOpacity(.3),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "+91 ${widget.phone}",
                  style: GoogleFonts.openSans(
                      color: Color(0xff262626),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height / 25.13,
                ),
                FlutterOtpField(
                  inputFieldLength: 6,
                  spaceBetweenFields: 5,

                  inputDecoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 20),
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: " ",
                      counterText: "",
                      hintStyle: GoogleFonts.openSans(
                          color: Color(0xff656565),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),

                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff006BA6), width: 2.0),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff006BA6), width: 2.0),
                          borderRadius: BorderRadius.circular(30))),
                  onValueChange: (String value) {
                    print("otp changed $value");
                  },
                  onCompleted: (String value) {
                    setState(() {
                      otp.text = value;
                    });
                    print("otp  $value");
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 37.7),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode,
                          smsCode: otp.text,
                        )).then((value) async {
                          if (value.user != null) {
                            var document = await FirebaseFirestore.instance.collection('Users').get();
                            for (int i = 0; i < document.docs.length; i++) {
                              if (document.docs[i]['phone'] == widget.phone) {
                                FirebaseFirestore.instance.collection('Users').doc(document.docs[i].id).update({
                                  "id": value.user!.uid,
                                  "fcmToken": fcmToken
                                });
                                setState(() {
                                  //userId = document.docs[i].id;
                                });
                              }
                            }
                            Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);

                          /*  Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                    (Route<dynamic> route) => false);*/
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged In Successfully")));
                          }
                        });
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                      }
                    },
                    child: Container(
                      height: height / 18.85,
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          color: Color(0xff006BA6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.only(top: height/94.25),
                        child: Text(
                          "Verify Code",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: 50,left: 35),
              child: Container(
                // color: Colors.red,
                width: width,
                height: 220,
                child: RiveAnimation.asset("assets/LOGINCHURCH .riv",fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 1.34),
              child: Container(
                child: Image.asset("assets/vec3.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 1.09, left: width / 7.2),
              child: Container(
                height: height / 12.56,
                child: Opacity(
                    opacity: 0.30, child: Image.asset("assets/cross3.png")),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 1.16, left: width / 2.76),
              child: Container(
                height: height / 7.54,
                child: Opacity(
                    opacity: .30, child: Image.asset("assets/cross3.png")),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 1.25, left: width / 1.56),
              child: Container(
                height: height / 5.02,
                child: Opacity(
                    opacity: 0.30, child: Image.asset("assets/cross3.png")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
