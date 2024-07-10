import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cms_app_v2/AudioPlayer/myaudio.dart';

import '../constant.dart';

//import 'colors.dart';

class PlayerControls extends StatelessWidget {
  String Urls;
  PlayerControls(this.Urls);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Controls(
            icon: Icons.repeat,
          ),
          Controls(
            icon: Icons.skip_previous,
          ),
          PlayControl(Urls),
          Controls(
            icon: Icons.skip_next,
          ),
          Controls(
            icon: Icons.shuffle,
          ),
        ],
      ),
    );
  }
}

class PlayControl extends StatelessWidget {

  String Urls;
  PlayControl(this.Urls);
  @override
  Widget build(BuildContext context) {
    return
      Consumer<MyAudio>(
        builder: (_,myAudioModel,child)=>
         GestureDetector(
          onTap: (){
            myAudioModel.audioState=="Playing"? myAudioModel.pauseAudio():myAudioModel.playAudio(Urls);
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    offset: Offset(5, 10),
                    spreadRadius: 3,
                    blurRadius: 10),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -4),
                    spreadRadius: -2,
                    blurRadius: 20)
              ],
            ),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: primaryColor.withOpacity(0.5),
                              offset: Offset(5, 10),
                              spreadRadius: 3,
                              blurRadius: 10),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-3, -4),
                              spreadRadius: -2,
                              blurRadius: 20)
                        ]),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    decoration:
                        BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                        child: Icon(
                    myAudioModel.audioState=="Playing"?Icons.pause: Icons.play_arrow,
                      size: 50,
                      color: primaryColor,
                    )),
                  ),
                ),
              ],
            ),
          ),
    ),
      );
  }
}

class Controls extends StatelessWidget {
  final IconData ? icon;

  const Controls({Key ?key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: primaryColor.withOpacity(0.5),
              offset: Offset(5, 10),
              spreadRadius: 3,
              blurRadius: 10),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -4),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        offset: Offset(5, 10),
                        spreadRadius: 3,
                        blurRadius: 10),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: -2,
                        blurRadius: 20)
                  ]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                icon,
                size: 30,
                color: primaryColor,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
