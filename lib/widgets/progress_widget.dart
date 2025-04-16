import "package:flutter/material.dart";
import "package:pomodoroapp/timer_service.dart";
import "package:pomodoroapp/utils.dart";
import "package:provider/provider.dart";

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${provider.round}/4",
              style: textStyle(20, Colors.grey[400], FontWeight.bold),
            ),
            Text(
              "round",
              style: textStyle(20, Colors.grey[400], FontWeight.bold),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${provider.goal}/12",
              style: textStyle(20, Colors.grey[400], FontWeight.bold),
            ),
            Text(
              "goal",
              style: textStyle(20, Colors.grey[400], FontWeight.bold),
            ),
          ],
        ),
      ],
    );
    // return Column(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Text(
    //           "0/4",
    //           style: textStyle(20, Colors.grey[350], FontWeight.bold),
    //         ),
    //         Text(
    //           "0/12",
    //           style: textStyle(20, Colors.grey[350], FontWeight.bold),
    //         )
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Text(
    //           "round",
    //           style: textStyle(20, Colors.grey[350], FontWeight.bold),
    //         ),
    //         Text(
    //           "goal",
    //           style: textStyle(20, Colors.grey[350], FontWeight.bold),
    //         )
    //       ],
    //     )
    //   ],
    // );
  }
}
