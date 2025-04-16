import "package:flutter/material.dart";
import "package:pomodoroapp/utils.dart";
import "package:pomodoroapp/widgets/progress_widget.dart";
import "package:pomodoroapp/widgets/time_controller.dart";
import "package:pomodoroapp/widgets/time_options.dart";
import "package:pomodoroapp/widgets/timer_card.dart";

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "PomoTimer",
          style: textStyle(30, Colors.red.shade900, FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.red.shade900),
            onPressed: () {},
            iconSize: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 40),
            //focus/rest text
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3, color: Colors.red.shade900),
              ),
              child: Text(
                'focus',
                style: textStyle(35, Colors.black, FontWeight.w100),
              ),
            ),
            SizedBox(height: 15),
            Stack(
              alignment: Alignment.center,
              children: [
                //tomato bg image
                Opacity(
                  opacity: 0.95,
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage("resources/tomato.png"),
                    width: MediaQuery.of(context).size.width - 70,
                    height: MediaQuery.of(context).size.width - 100,
                  ),
                ),
                //countdown timer
                Positioned(
                    child: Column(children: [
                      TimerCard(),
                    ]),
                    top: MediaQuery.of(context).size.width / 2 - 70),
              ],
            ),
            SizedBox(height: 25),

            //scrollview of different time options
            TimeOptions(),

            SizedBox(height: 25),

            //buttons
            TimeController(),

            SizedBox(height: 20),

            ProgressWidget(),
          ],
        ),
      )),
    );
  }
}
