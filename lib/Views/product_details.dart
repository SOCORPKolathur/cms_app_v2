import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms_app_v2/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/my_cart.dart';
import 'package:cms_app_v2/Views/product_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class ProductDetails extends StatefulWidget {
  String docid;
  double price;
   ProductDetails({required this.docid,required this.price});

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
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Products").doc(widget.docid).get(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            Map<String, dynamic>? val = snapshot.data!.data();
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: height / 37.7,
                    ),
                    child: Container(
                      width: width / 1.1,
                      height: height / 3.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(val!["imgUrl"], fit: BoxFit
                            .cover,),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 48,),
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
                            val["title"],
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
                        "₹${val["price"]}/-",
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
                      child: Text(val["description"],
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
                    padding: EdgeInsets.only(top: height / 40.8),
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
            );
          }
          return LoadingState();
        }
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
                "₹${widget.price * counter}/-",
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
