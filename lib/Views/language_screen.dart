import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/home_page.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../constant.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  List<ChooseLanguageModel> languagesList = [
    ChooseLanguageModel(
      name: "Tamil",
      orgName: "தமிழ்",
      code: "ta",
    ),
    ChooseLanguageModel(
      name: "English",
      orgName: "English",
      code: "en_US",
    ),
    ChooseLanguageModel(
      name: "Hindi",
      orgName: "हिंदी",
      code: "hi",
    ),
    ChooseLanguageModel(
      name: "Telugu",
      orgName: "తెలుగు",
      code: "te",
    ),
    ChooseLanguageModel(
      name: "Malayalam",
      orgName: "മലയാളം",
      code: "ml",
    ),
    ChooseLanguageModel(
      name: "Kannada",
      orgName: "ಕನ್ನಡ",
      code: "kn",
    ),
    ChooseLanguageModel(
      name: "Bengali",
      orgName: "বাংলা",
      code: "bn",
    ),
    ChooseLanguageModel(
      name: "Spanish",
      orgName: "Español",
      code: "es",
    ),
    ChooseLanguageModel(
      name: "Portuguese",
      orgName: "Português",
      code: "pt",
    ),
    ChooseLanguageModel(
      name: "French",
      orgName: "Français",
      code: "fr",
    ),
    ChooseLanguageModel(
      name: "Dutch",
      orgName: "Nederlands",
      code: "nl",
    ),
    ChooseLanguageModel(
      name: "German",
      orgName: "Deutsch",
      code: "de",
    ),
    ChooseLanguageModel(
      name: "Italian",
      orgName: "Italiano",
      code: "it",
    ),
    ChooseLanguageModel(
      name: "Swedish",
      orgName: "Svenska",
      code: "sv",
    )
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height / 7.54,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 0.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: height / 18.85),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 12,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: textColor,
                          )),
                      SizedBox(
                        width: width / 6,
                      ),
                      Text(
                        "Languages",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 25.13),
                child: Text(
                  'Choose your language',
                  style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 75.4),
                child: Text(
                  'Pick the language you understand best',
                  style: GoogleFonts.sofiaSans(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 25.13, left: width / 12),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        changeLocale(context, "ta");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);

                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: height/37.7),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/tamil.png'),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: height/75.4),
                              child: Text('தமிழ்',
                                  style: GoogleFonts.notoSansTamil(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Tamil',
                                style: GoogleFonts.sofiaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 19.6,
                    ),
                    InkWell(
                      onTap: () {
                        changeLocale(context, "en_US");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);

                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(top: height/37.7),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/eng.png'),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: height/75.4),
                              child: Text('English',
                                  style: GoogleFonts.sofiaSans(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('USK/UK',
                                style: GoogleFonts.sofiaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 25.13, left: width / 12),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        changeLocale(context, "hi");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);

                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height/37.7),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/hindi_img.png'),
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(top: height/25.13),
                              child: Text('Hindi',
                                  style: GoogleFonts.sofiaSans(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 19.6,
                    ),
                    InkWell(
                      onTap: () {
                        changeLocale(context, "ml");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: height/37.7),
                              child: CircleAvatar(
                                backgroundColor: Color(0xffFFFFFF),
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/malayalam.png'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height/75.4),
                              child: Text('മലയാളം',
                                  style: GoogleFonts.notoSansMalayalam(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Malayalam',
                                style: GoogleFonts.sofiaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 25.13, left: width / 12),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        changeLocale(context, "kn");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);

                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: height/37.7),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child: Image(
                                    image: AssetImage('assets/kannada_img.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height/75.4),
                              child: Text('ಕನ್ನಡ',
                                  style: GoogleFonts.notoSansKannada(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Kannada',
                                style: GoogleFonts.sofiaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 19.6,
                    ),
                    InkWell(
                      onTap: () {
                        changeLocale(context, "te");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);

                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: height/37.7),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/telungu.png'),
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(top: height/75.4),
                              child: Text('తెలుంగు',
                                  style: GoogleFonts.notoSansTelugu(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Telugu',
                                style: GoogleFonts.sofiaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 25.13, left: width / 12),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        changeLocale(context, "bn");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);

                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height/37.7),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/gujarath.png'),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: height/75.4),
                              child: Text('বাংলা',
                                  style: GoogleFonts.notoSansGujarati(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Bengali',
                                style: GoogleFonts.sofiaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: width / 19.6),
                    InkWell(
                      onTap: () {
                        changeLocale(context, "es");
                        Navigator.pushAndRemoveUntil(context, PageTransition(type: PageTransitionType.scale, child: HomePage(),/*duration: Duration(milliseconds: 1200),reverseDuration: Duration(milliseconds: 500),*/alignment: Alignment.center),(Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: width / 2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: height/37.7),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child: Image(
                                    image: AssetImage('assets/urdu.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: height/75.4),
                              child: Text('Español',
                                  style: GoogleFonts.notoSansUgaritic(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Spanish',
                                style: GoogleFonts.sofiaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 25.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ChooseLanguageModel {
  ChooseLanguageModel({this.name, this.code, this.orgName});

  String? name;
  String? orgName;
  String? code;
}