import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//import 'package:cms_app_v2/AudioPlayer/colors.dart';
import 'package:cms_app_v2/AudioPlayer/myaudio.dart';
import 'package:cms_app_v2/AudioPlayer/playerControls.dart';
import '../constant.dart';
import 'albumart.dart';
import 'navbar.dart';
import '../constant.dart';


class AudioPlayerPage extends StatefulWidget {
  String Imageurl;
  String Url;
  String title;
  String singer;
  AudioPlayerPage(this.Imageurl,this.Url,this.title,this.singer);
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  double sliderValue = 2;

  String Image="";
  String Url="";

  @override
  void initState() {
   setState(() {
     Image=widget.Imageurl;
     Url=widget.Url;
   });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
          "Audio Podcasts",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),

      // backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         // NavigationBar1(),
          Container(
            margin: EdgeInsets.only(left: 40),
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt(Image);
              },
              itemCount: 1,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: primaryColor),
          ),
          Text(
            "Vocal by: ${widget.singer}",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: primaryColor),
          ),
          Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                    trackHeight: 5,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)
                ),
                child: Consumer<MyAudio>(
                  builder:(_,myAudioModel,child)=> Slider(
                    value: myAudioModel.position==null? 0 : myAudioModel.position!.inMilliseconds.toDouble() ,
                    activeColor: primaryColor,
                    inactiveColor: primaryColor.withOpacity(0.3),
                    onChanged: (value) {

                      myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));

                    },
                    min: 0,
                    max:myAudioModel.totalDuration==null? 20 : myAudioModel.totalDuration!.inMilliseconds.toDouble() ,
                  ),
                ),
              ),
            ],

          ),

          PlayerControls(Url),

          SizedBox(height: 100,)
        ],
      ),
    );
  }
}

