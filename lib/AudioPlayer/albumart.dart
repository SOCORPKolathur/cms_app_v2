import 'package:flutter/material.dart';

import '../constant.dart';
//import 'package:cms_app_v2/AudioPlayer/colors.dart';


class AlbumArt extends StatelessWidget {
  String Imgurl;
  AlbumArt(this.Imgurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(Imgurl,fit: BoxFit.fill,)),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: primaryColor,
              offset: Offset(20,8),
              spreadRadius: 3,
              blurRadius: 25
          ),
          BoxShadow(color: Colors.white,offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
          )
        ],

      ),

    );
  }
}
