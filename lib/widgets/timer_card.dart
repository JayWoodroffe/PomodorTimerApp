// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:pomodoroapp/timer_service.dart";
import "package:pomodoroapp/utils.dart";
import "package:provider/provider.dart";

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
                child: Text((provider.currentDuration ~/ 60).toString(),
                    style: textStyle(60, Colors.white))),
            width: MediaQuery.of(context).size.width / 3.7,
            height: 110,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(width: 10),
          Text(":", style: textStyle(60, Colors.white)),
          SizedBox(width: 10),
          Container(
            child: Center(
                child: Text(
                    seconds == 0
                        ? "${seconds.round()}0"
                        : seconds.round().toString(),
                    style: textStyle(60, Colors.white))),
            width: MediaQuery.of(context).size.width / 3.7,
            height: 110,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      )
    ]);
  }
}
