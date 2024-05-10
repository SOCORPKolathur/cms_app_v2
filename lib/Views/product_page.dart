import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/product_details.dart';
import 'package:cms_app_v2/constant.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_cart.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Product",
          style: GoogleFonts.sofiaSans(
            fontWeight: FontWeight.w800,
            color: textColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyCart()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width/36, top: height/37.7),
              child: Text(
                "Church Products",
                style: GoogleFonts.sofiaSans(
                  color: TextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width/36),
              child: Text(
                "The best of church products all in one place",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.5),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width/18, top: height/37.7),
              child: Container(
                width: width/1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF5F5F5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: TextColor.withOpacity(.3),
                        ),
                      ),
                      hintStyle: GoogleFonts.sofiaSans(
                          color: Color(0xff262626).withOpacity(.3))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height/37.7),
              child: Row(
                children: [
                  SizedBox(
                    width: width/18,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: width/2.4,
                      height:height/3.4,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: height/25.13, left: width/72),
                                  child: Container(
                                    width: width/2,
                                    child: Image.asset("assets/circle1.png"),
                                  ),
                                ),
                                Container(
                                  child: Image.asset("assets/flower.png"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: width/18, ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Flower",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: TextColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width/78),
                                      child: Text(
                                        "₹299 /-",
                                        style: GoogleFonts.sofiaSans(
                                            fontSize: 14,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:EdgeInsets.only(left: width/18),
                                  child: CircleAvatar(
                                      radius: 20,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.shopping_cart_outlined))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width/18,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: width/2.4,
                      height:height/3.4,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails()));
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: height/21.54, left: width/36),
                                  child: Container(
                                    width: width/2,
                                    child: Image.asset("assets/circle2.png"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: height/25.13),
                                  child: Container(
                                    width: width/2.7,
                                    child: Image.asset("assets/candle.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width/18, top: height/150.8),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Candles",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: TextColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: width/78),
                                      child: Text(
                                        "₹299 /-",
                                        style: GoogleFonts.sofiaSans(
                                            fontSize: 14,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/18),
                                  child: CircleAvatar(
                                      radius: 20,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.shopping_cart_outlined))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: height/37.7),
              child: Row(
                children: [
                  SizedBox(
                    width: width/18,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: width/2.4,
                      height:height/3.4,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: height/25.13, left: width/72),
                                child: Container(
                                  width: width/2,
                                  child: Image.asset("assets/circle3.png"),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: width/18),
                                child: Container(
                                  width: width/4,
                                  child: Image.asset("assets/sandelcandle.png"),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: width/18, ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Flower",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: TextColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: width/78),
                                      child: Text(
                                        "₹299 /-",
                                        style: GoogleFonts.sofiaSans(
                                            fontSize: 14,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/18),
                                  child: CircleAvatar(
                                      radius: 20,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.shopping_cart_outlined))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width/18,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: width/2.4,
                      height:height/3.4,
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: height/50.26),
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: height/50.26, left: width/72),
                                  child: Container(
                                    width: width/2,
                                    child: Image.asset("assets/circle4.png"),
                                  ),
                                ),
                                Container(
                                  child: Image.asset("assets/gifts.png"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width/18, ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Flower",
                                      style: GoogleFonts.sofiaSans(
                                          fontSize: 14,
                                          color: TextColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width/78),
                                      child: Text(
                                        "₹299 /-",
                                        style: GoogleFonts.sofiaSans(
                                            fontSize: 14,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/18),
                                  child: CircleAvatar(
                                      radius: 20,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.shopping_cart_outlined))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height/37.7,)
          ],
        ),
      ),
    );
  }
}
