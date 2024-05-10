import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../constant.dart';

class ChurchPastors extends StatefulWidget {
   ChurchPastors({super.key});

  @override
  State<ChurchPastors> createState() => _ChurchPastorsState();
}

class _ChurchPastorsState extends State<ChurchPastors> {
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
          "Church Pastors",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width/18, top: height/37.7),
              child: Container(
                height: height/4.71,
                width: width/1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xff000000).withOpacity(.1)),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: width/7.2,
                            child: Image.asset("assets/Mask group (16).png"),
                          ),
                          title: Text(
                            "Peter Chrysologus",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "Senior Pastor",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor.withOpacity(.5),
                                fontWeight: FontWeight.w800),
                          ),
                          trailing: Padding(
                            padding:  EdgeInsets.only(bottom: height/50.26),
                            child: Text(
                              "( IKIA Curch )",
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 12,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height/37.7,
                          width: width/1.12,
                          child:
                              Divider(color: Color(0xff000000).withOpacity(.1)),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: height/150.8,  left: width/72),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              Text(
                                "Korattur,Chennai",
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 14,
                                    color: TextColor.withOpacity(.5),
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: width/18,
                              ),
                              Container(
                                height: height/15.08,
                                width: width/2.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primaryColor,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width/18,
                                    ),
                                    Icon(
                                      Icons.phone,
                                      color: textColor,
                                    ),
                                    Text(
                                      "Contact Now",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: textColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/5.23),
                      child: Container(
                        child: Image.asset("assets/Rectangle.png"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width/18, top: height/37.7),
              child: Container(
                height: height/4.71,
                width: width/1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xff000000).withOpacity(.1)),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: width/7.2,
                            child: Image.asset("assets/Mask group (16).png"),
                          ),
                          title: Text(
                            "Peter Chrysologus",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "Senior Pastor",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor.withOpacity(.5),
                                fontWeight: FontWeight.w800),
                          ),
                          trailing: Padding(
                            padding:  EdgeInsets.only(bottom: height/50.26),
                            child: Text(
                              "( IKIA Curch )",
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 12,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height/37.7,
                          width: width/1.12,
                          child:
                              Divider(color: Color(0xff000000).withOpacity(.1)),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: height/150.8,  left: width/72),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              Text(
                                "Korattur,Chennai",
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 14,
                                    color: TextColor.withOpacity(.5),
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: width/18,
                              ),
                              Container(
                                height: height/15.08,
                                width: width/2.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primaryColor,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width/18,
                                    ),
                                    Icon(
                                      Icons.phone,
                                      color: textColor,
                                    ),
                                    Text(
                                      "Contact Now",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: textColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/5.23),
                      child: Container(
                        child: Image.asset("assets/Rectangle (1).png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width/18, top: height/37.7),
              child: Container(
                height: height/4.71,
                width: width/1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xff000000).withOpacity(.1)),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: width/7.2,
                            child: Image.asset("assets/Mask group (16).png"),
                          ),
                          title: Text(
                            "Peter Chrysologus",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "Senior Pastor",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor.withOpacity(.5),
                                fontWeight: FontWeight.w800),
                          ),
                          trailing: Padding(
                            padding:  EdgeInsets.only(bottom: height/50.26),
                            child: Text(
                              "( IKIA Curch )",
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 12,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height/37.7,
                          width: width/1.12,
                          child:
                              Divider(color: Color(0xff000000).withOpacity(.1)),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: height/150.8,  left: width/72),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              Text(
                                "Korattur,Chennai",
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 14,
                                    color: TextColor.withOpacity(.5),
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: width/18,
                              ),
                              Container(
                                height: height/15.08,
                                width: width/2.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primaryColor,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width/18,
                                    ),
                                    Icon(
                                      Icons.phone,
                                      color: textColor,
                                    ),
                                    Text(
                                      "Contact Now",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: textColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/5.23),
                      child: Container(
                        child: Image.asset("assets/Rectangle (2).png"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width/18, top: height/37.7),
              child: Container(
                height: height/4.71,
                width: width/1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xff000000).withOpacity(.1)),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: width/7.2,
                            child: Image.asset("assets/Mask group (16).png"),
                          ),
                          title: Text(
                            "Peter Chrysologus",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "Senior Pastor",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor.withOpacity(.5),
                                fontWeight: FontWeight.w800),
                          ),
                          trailing: Padding(
                            padding:  EdgeInsets.only(bottom: height/50.26),
                            child: Text(
                              "( IKIA Curch )",
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 12,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height/37.7,
                          width: width/1.12,
                          child:
                              Divider(color: Color(0xff000000).withOpacity(.1)),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: height/150.8,  left: width/72),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              Text(
                                "Korattur,Chennai",
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 14,
                                    color: TextColor.withOpacity(.5),
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: width/18,
                              ),
                              Container(
                                height: height/15.08,
                                width: width/2.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primaryColor,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width/18,
                                    ),
                                    Icon(
                                      Icons.phone,
                                      color: textColor,
                                    ),
                                    Text(
                                      "Contact Now",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: textColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/5.23),
                      child: Container(
                        child: Image.asset("assets/Rectangle (3).png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height/25.13,)
          ],
        ),
      ),
    );
  }
}
