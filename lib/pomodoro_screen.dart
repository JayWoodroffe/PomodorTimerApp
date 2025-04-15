import "package:flutter/material.dart";
import "package:pomodoroapp/utils.dart";

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
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.95,
              child: Image(
                alignment: Alignment.bottomCenter,
                image: AssetImage("resources/tomato.png"),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
                child: Text("hello"),
                top: MediaQuery.of(context).size.width / 2 + 20)
          ],
        ),
      )),
    );
  }
}
