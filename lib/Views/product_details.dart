import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/my_cart.dart';
import 'package:cms_app_v2/Views/product_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
          "Product Details",
          style: GoogleFonts.sofiaSans(
              fontSize: 24, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 18.85, left: width / 18),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Color(0xffA6D6FF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height / 37.7,
                    ),
                    child: Container(
                      width: width / 1.8,
                      child: Image.asset("assets/candle.png"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 18,
                  ),
                  Container(
                    width: width / 1.8,
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        "Blue Candles For Church",
                        style: GoogleFonts.sofiaSans(
                            fontSize: 24,
                            color: TextColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 12,
                  ),
                  Text(
                    "₹299 /-",
                    style: GoogleFonts.sofiaSans(
                        fontSize: 24,
                        color: primaryColor,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 75.4),
                child: Container(
                  width: width / 1.12,
                  child: Text(
                    "Candles fit in most standard votive candle holders and lanterns Made in the India with"
                    " quality wax from core to overdip so candles maintain "
                    "color in the India with quality wax from core to overdip so candles maintain color ",
                    style: GoogleFonts.sofiaSans(
                      fontSize: 16,
                      color: TextColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: width / 1.71, top: height / 75.4),
                child: Text(
                  "Quantity : ",
                  style: GoogleFonts.sofiaSans(
                      fontSize: 24,
                      color: TextColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 150.8),
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
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.minimize_outlined,
                          color: textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 12,
                    ),
                    Text('$counter'),
                    SizedBox(
                      width: width / 12,
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
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.add,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 10.77,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Stack(
          children: [
            Material(
              elevation: 5,
              child: Container(
                height: height / 9.42,
                width: double.infinity,
                decoration: BoxDecoration(color: textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 37.7, left: width / 18),
              child: Text(
                "₹299 /-",
                style: GoogleFonts.sofiaSans(
                    fontSize: 24,
                    color: primaryColor,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 2, top: height / 37.7),
              child: InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    showSnackBar(context);
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //
                    //   width: MediaQuery.of(context).size.width * 0.46,
                    //   elevation: 5.0,
                    //   backgroundColor: primaryColor.withOpacity(.3),
                    //   behavior: SnackBarBehavior.floating,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15.0)),
                    //   content: Wrap(
                    //     children: [
                    //       Container(
                    //         //height: 20,
                    //
                    //         child: Text(
                    //           'Successfully Add to Cart',
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ));
                  },
                  child: Container(
                    height: height / 18.85,
                    width: width / 2.4,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(left: width / 24),
                      child: Row(
                        children: [
                          Text(
                            "Add to Cart",
                            style: GoogleFonts.sofiaSans(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.w800),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Successfully add to cart'),
      backgroundColor: primaryColor,
      behavior: SnackBarBehavior.floating,
      width: 200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
