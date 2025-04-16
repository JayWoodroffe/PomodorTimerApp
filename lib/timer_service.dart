import "dart:async";

import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";

//service manages the countdown timer
class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int round = 0;
  int goal = 0;
  String currentState = "focus";

  final player = AudioPlayer();

  //asynchronously play a ping sound when the round changes
  _playSound() async {
    player.setVolume(1.0);
    await player.play(AssetSource("ping.mp3"));
  }

  //starts the timer
  void start() {
    timerPlaying = true;
    notifyListeners();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //timer reaches zero, round changes and resets
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = "focus";
    currentDuration = selectedTime = 1500;
    round = 0;
    goal = 0;
    timerPlaying = false;
    notifyListeners();
  }

  //after each focus session, round counter must increase and break begins
  void handleNextRound() {
    _playSound();
    //focus round -> break round of 300 seconds
    if (currentState == "focus" && round != 3) {
      currentState = "break";
      currentDuration = 5;
      selectedTime = 5;
      round++;
      goal++;
    }
    //break round -> focus round of initially selected time
    else if (currentState == "break") {
      currentState = "focus";
      currentDuration = selectedTime;
    }
    //after the fourth focus round completes, user receives a long break of 25m
    else if (currentState == "focus" && round == 3) {
      currentState = "long break";
      currentDuration = 1500;
      round++;
      goal++;
    }
    //after the long break, user returns to selected focus time
    else if (currentState == "long break") {
      currentState = "focus";
      currentDuration = selectedTime;
      round = 0;
    }
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }
}
