import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/otp_page.dart';
import 'package:cms_app_v2/Views/register_screen.dart';
import 'package:cms_app_v2/Views/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';

import '../constant.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = new TextEditingController();
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
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 6, top: height / 37.7),
                  child: Text(
                    "Log in to your account",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Text(
                    'Kindly enter your login details',
                    style: GoogleFonts.sofiaSans(
                      color: TextColor.withOpacity(.6),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 300,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 1.8, top: height / 25.13),
                  child: Text(
                    " Phone Number",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  width: width / 1.2,
                  height: height / 15.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: textColor,
                      border: Border.all(color: Colors.grey.withOpacity(.3))),
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            top: height / 37.7, bottom: width / 251.33),
                        hintText: 'Kindly enter your phone number',
                        counter: SizedBox(),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: EdgeInsets.only(top: height / 75.4),
                            child: Icon(
                              Icons.phone,
                              size: 20,
                              color: TextColor.withOpacity(.3),
                            ),
                          ),
                        ),
                        hintStyle: GoogleFonts.sofiaSans(
                            color: Color(0xff262626).withOpacity(.3))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 50.26),
                  child: InkWell(
                    onTap: () async {
                      var document = await FirebaseFirestore.instance.collection('Users').where('phone',isEqualTo: phone.text).get();

                      if(document.docs.length>0) {
                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: OtpPage(phone: phone.text),/*duration: Duration(milliseconds: 800),reverseDuration: Duration(milliseconds: 500)*/));

                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Your number is not register yet."))
                        );
                      }
                    },
                    child: Container(
                      height: height / 18.85,
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 150.8),
                        child: Text(
                          "Log in",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 37.7),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                    },
                    child: RichText(
                      // Parent Widget
                      text: TextSpan(
                        text: 'Don’t have an account ?',
                        style: GoogleFonts.sofiaSans(
                          fontSize: 14,
                          color: TextColor.withOpacity(.4),
                        ),
                        children: <TextSpan>[
                          // Child Widget
                          TextSpan(
                            text: 'Register',
                            style: GoogleFonts.sofiaSans(
                              fontSize: 14,
                              color: primaryColor,
                            ),
                          ),
                        ],
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
