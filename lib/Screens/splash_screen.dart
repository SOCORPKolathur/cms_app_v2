import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/home_page.dart';
import 'package:cms_app_v2/Views/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../Views/login_page.dart';
import '../constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }
  User? user = FirebaseAuth.instance.currentUser;
  Future<void> _navigateToNextScreen() async {
    var document = await FirebaseFirestore.instance.collection("Users").get();
    await Future.delayed(const Duration(seconds: 1));
    if(user != null){
      for(int i=0;i<document.docs.length;i++){
        if(document.docs[i]['id']==user!.uid){
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.scale, child: HomePage()/*,duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500)*/,alignment: Alignment.center));

        }
      }
    }else {
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.scale, child: SignInPage()/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500)*/,alignment: Alignment.center));


    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height / 25.13),
              child: SizedBox(
                height: height / 2.15,
                child: Image.asset("assets/cross1.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 1.8, top: height / 1.47),
              child: SizedBox(
                height: height / 3.01,
                child: Image.asset("assets/cross2.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 3.6, top: height / 2.35),
              child: Stack(
                children: [
                  SizedBox(
                    width: width / 2.11,
                    child: Image.asset("assets/white_vector.png"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 12, top: height / 37.7),
                    child: SizedBox(
                      width: width / 3.6,
                      child: Image.asset("assets/holy_church.png"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 1.6, left: width / 4),
              child: Text(
                "IKIA CHURCH",
                style: GoogleFonts.sofiaSans(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
