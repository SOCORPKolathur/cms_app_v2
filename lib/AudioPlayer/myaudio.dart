

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyAudio extends ChangeNotifier{

  Duration ? totalDuration;
  Duration ?position;
  String? audioState;

  MyAudio(){
    initAudio();
  }

  AudioPlayer audioPlayer = AudioPlayer();

  initAudio(){
    audioPlayer.onDurationChanged.listen((updatedDuration) {
        totalDuration = updatedDuration;
        notifyListeners();
    });

    audioPlayer.onPositionChanged.listen((updatedPosition) {
        position = updatedPosition;
        notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if(playerState == PlayerState.stopped)
        audioState = "Stopped";
      if(playerState==PlayerState.playing)
        audioState = "Playing";
      if(playerState == PlayerState.paused)
        audioState = "Paused";
      notifyListeners();
    });
  }

  playAudio(String url){
    audioPlayer.setSourceUrl(url);
    audioPlayer.play(audioPlayer.source!);
  }


  pauseAudio(){
    audioPlayer.pause();
  }

  stopAudio(){
    audioPlayer.stop();
  }

  seekAudio(Duration durationToSeek){
    audioPlayer.seek(durationToSeek);
  }



}