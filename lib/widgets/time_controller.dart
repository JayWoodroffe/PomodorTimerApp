import "package:flutter/material.dart";
import "package:pomodoroapp/timer_service.dart";
import "package:provider/provider.dart";

class TimeController extends StatelessWidget {
  const TimeController({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            provider.timerPlaying
                ? Provider.of<TimerService>(context, listen: false).pause()
                : Provider.of<TimerService>(context, listen: false).start();
          },
          icon: provider.timerPlaying
              ? Icon(
                  Icons.pause,
                )
              : Icon(Icons.play_arrow),
          color: Colors.white,
          iconSize: 55,
        ),
      ),
    );
  }
}
