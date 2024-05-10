import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/product_details.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int counter = 1;

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
          "My Cart",
          style: GoogleFonts.sofiaSans(
              fontSize: 24, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width / 72, top: height / 25.13),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: height / 5.38,
                width: width / 1.09,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 36, top: height / 75.4),
                          child: Container(
                            width: width / 4.5,
                            child: Image.asset("assets/circle2.png"),
                          ),
                        ),
                        Container(
                          width: width / 3.6,
                          child: Image.asset("assets/candle.png"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 37.7),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Blue Candles",
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 20,
                                    color: TextColor,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: width / 12,
                              ),
                              Icon(Icons.delete)
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Color :",
                                    style: GoogleFonts.sofiaSans(
                                      fontSize: 14,
                                      color: TextColor,
                                    ),
                                  ),
                                  Text(
                                    "Blue",
                                    style: GoogleFonts.sofiaSans(
                                      fontSize: 14,
                                      color: TextColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width / 12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Size :",
                                    style: GoogleFonts.sofiaSans(
                                      fontSize: 14,
                                      color: TextColor,
                                    ),
                                  ),
                                  Text(
                                    "Small",
                                    style: GoogleFonts.sofiaSans(
                                      fontSize: 14,
                                      color: TextColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height / 75.4),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (counter > 1) {
                                            counter--; // Decrease the counter if it's greater than 1
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: width / 12,
                                        height: height / 25.13,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(
                                          Icons.minimize_outlined,
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 72,
                                    ),
                                    Text('$counter'),
                                    SizedBox(
                                      width: width / 72,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          counter++;
                                        });
                                      },
                                      child: Container(
                                          width: width / 12,
                                          height: height / 25.13,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                            Icons.add,
                                            color: textColor,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 7.2, top: height / 75.4),
                                child: Text(
                                  "₹299 /-",
                                  style: GoogleFonts.sofiaSans(
                                      fontSize: 16,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 12.56,
            width: width / 1.09,
            child: Divider(
              color: TextColor.withOpacity(.1),
            ),
          ),
          SizedBox(
            height: height / 3.77,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 12,
              ),
              Text(
                "Sub total ( 1 item )",
                style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    color: TextColor.withOpacity(.4),
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                width: width / 4.5,
              ),
              Text(
                "₹299",
                style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    color: TextColor.withOpacity(.8),
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: width / 12,
              ),
              Text(
                "Shipping",
                style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    color: TextColor.withOpacity(.4),
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                width: width / 2.11,
              ),
              Text(
                "Free",
                style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    color: TextColor.withOpacity(.8),
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          SizedBox(
            height: height / 25.13,
            width: width / 1.09,
            child: Divider(
              color: TextColor.withOpacity(.1),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: width / 12,
              ),
              Text(
                "Total Price",
                style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    color: TextColor.withOpacity(.8),
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                width: width / 2.57,
              ),
              Text(
                "₹299 /-",
                style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    color: TextColor.withOpacity(.8),
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          SizedBox(
            height: height / 37.7,
          ),
          Container(
            height: height / 13.70,
            width: width / 1.2,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: height / 50.26),
              child: Text(
                "Check Out",
                textAlign: TextAlign.center,
                style: GoogleFonts.sofiaSans(
                    fontSize: 20,
                    color: textColor.withOpacity(.8),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
