import 'package:flutter/material.dart';
import 'package:cms_app_v2/Views/login_page.dart';
import 'package:cms_app_v2/Views/sign_in_page.dart';
import 'package:cms_app_v2/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Image.asset("assets/vec1.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 12.56),
              child: Container(
                child: Image.asset("assets/frame1.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 6.85, left: width / 72),
              child: Container(
                width: width / 1.02,
                height: height / 1.19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: textColor,
                ),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: width / 4.5, top: height / 75.4),
                        child: Text(
                          "Create your account",
                          style: GoogleFonts.sofiaSans(
                            color: TextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Text(
                          'Kindly enter your details for create new account',
                          style: GoogleFonts.sofiaSans(
                            color: TextColor.withOpacity(.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 300,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            right: width / 1.63, top: height / 75.4),
                        child: Text(
                          "First Name",
                          style: GoogleFonts.sofiaSans(
                            color: TextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your first name',
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: TextColor.withOpacity(.3),
                                ),
                              ),

                              hintStyle: GoogleFonts.sofiaSans(
                                  color: Color(0xff262626).withOpacity(.3))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your first name";
                            }
                            return null;
                          },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: width / 1.63, top: height / 75.4),
                        child: Text(
                          "Last Name",
                          style: GoogleFonts.sofiaSans(
                            color: TextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your last name',
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: TextColor.withOpacity(.3),
                                ),
                              ),
                              hintStyle: GoogleFonts.sofiaSans(
                                  color: Color(0xff262626).withOpacity(.3))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your last name";
                            }
                            return null;
                          },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: width / 1.8, top: height / 75.4),
                        child: Text(
                          " Phone Number",
                          style: GoogleFonts.sofiaSans(
                            color: TextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your mobile number',
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: TextColor.withOpacity(.3),
                                ),
                              ),
                              hintStyle: GoogleFonts.sofiaSans(
                                  color: Color(0xff262626).withOpacity(.3))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your mobile number";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: width / 1.5, top: height / 75.4),
                        child: Text(
                          "Email ID",
                          style: GoogleFonts.sofiaSans(
                            color: TextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email ID',
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: TextColor.withOpacity(.3),
                                ),
                              ),
                              hintStyle: GoogleFonts.sofiaSans(
                                  color: Color(0xff262626).withOpacity(.3))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your email ID";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: width / 1.63, top: height / 75.4),
                        child: Text(
                          "City Name",
                          style: GoogleFonts.sofiaSans(
                            color: TextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your city name',
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: TextColor.withOpacity(.3),
                                ),
                              ),
                              hintStyle: GoogleFonts.sofiaSans(
                                  color: Color(0xff262626).withOpacity(.3))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your city name";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height / 37.7),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignInPage()));

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
                                builder: (context) => LoginPage()));
                          },
                          child: RichText(
                            // Parent Widget
                            text: TextSpan(
                              text: 'Already have an account ?',
                              style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                color: TextColor.withOpacity(.4),
                              ),
                              children: <TextSpan>[
                                // Child Widget
                                TextSpan(
                                  text: 'Log In',
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
