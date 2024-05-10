import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/login_page.dart';
import 'package:cms_app_v2/Views/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';

import '../constant.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {


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
                SizedBox(height: 38,),
                Container(
                  width: width/3.6,
                  child: Image.asset("assets/holy_church.png"),
                ),
                Text(
                  "Welcome to",
                  style: GoogleFonts.sofiaSans(
                    color: TextColor.withOpacity(.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "IKIA CHURCH",
                  style: GoogleFonts.sofiaSans(
                    color: TextColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "May the lord with us",
                  style: GoogleFonts.sofiaSans(
                    color: TextColor.withOpacity(.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/Vector2.png",
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/9.42),
                      child: Container(
                        width: width/4.5,
                        child: Opacity(
                            opacity: 0.6,
                            child: Image.asset("assets/cross1.png")),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/5.8, left: width/2.66),
                      child: Container(
                        width: width/4.5,
                        child: Opacity(
                          opacity:0.20,
                          child: Image.asset(
                            "assets/cross3.png",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/10.77, left: width/1.28),
                      child: Opacity(
                        opacity: 0.6,
                        child: Container(
                          width: width/4.5,
                          child: Image.asset("assets/cross2.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: width/12, top:height/7.54),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: LoginPage(),/*duration: Duration(milliseconds: 800),reverseDuration: Duration(milliseconds: 500)*/));
                         /* Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>LoginPage()));*/
                        },
                        child: Container(
                          height: height/16.75,
                          width: width/1.2,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: textColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(top: height/94.25),
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
                      padding:  EdgeInsets.only(left: width/12, top:height/4.71),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>RegisterScreen()));
                        },
                        child: Container(
                          height: height/16.75,
                          width: width/1.2,
                          decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:  EdgeInsets.only(top: height/94.25),
                            child: Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: 50,left: 35),
              child: Container(
               // color: Colors.red,
                width: width,
                height: 250,
                child: RiveAnimation.asset("assets/LOGINCHURCH .riv",fit: BoxFit.cover,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
