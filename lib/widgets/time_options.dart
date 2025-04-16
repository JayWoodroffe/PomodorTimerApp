import "package:flutter/material.dart";
import "package:pomodoroapp/timer_service.dart";
import "package:pomodoroapp/utils.dart";
import "package:provider/provider.dart";

class TimeOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 152),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(double.parse(time)),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 65,
              height: 50,
              decoration: int.parse(time) == provider.selectedTime
                  ? BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(5),
                    )
                  : BoxDecoration(
                      border: Border.all(width: 3, color: Colors.red.shade900),
                      borderRadius: BorderRadius.circular(5),
                    ),
              child: Center(
                child: int.parse(time) == provider.selectedTime
                    ? Text((int.parse(time) ~/ 60).toString(),
                        style: textStyle(25, Colors.white))
                    : Text((int.parse(time) ~/ 60).toString(),
                        style: textStyle(25, Colors.red.shade900)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
