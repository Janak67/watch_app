import 'dart:math';

import 'package:flutter/material.dart';

class Clock2 extends StatefulWidget {
  const Clock2({super.key});

  @override
  State<Clock2> createState() => _Clock2State();
}

class _Clock2State extends State<Clock2> {
  int hour = 0, minutes = 0, second = 0;

  void initState() {
    super.initState();
    digitalclock();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Clock"),
          backgroundColor: Colors.lightGreen,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                children:
                  List.generate(60, (index) => Transform.rotate(
                    angle: index*(pi*2)/60,
                    child: Divider(
                      color: index%5==0? Colors.red:Colors.white,
                      endIndent: MediaQuery.of(context).size.width*0.80,
                      indent: MediaQuery.of(context).size.width*0.15,
                    ),
                  ),),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: second*(pi*2)/60,
                  child: Divider(
                    color: Colors.white,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.22,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: minutes*(pi*2)/60,
                  child: Divider(
                    color: Colors.green,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.25,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: hour*(pi*2)/12,
                  child: Divider(
                    color: Colors.red,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void digitalclock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        minutes = DateTime.now().minute;
        second = DateTime.now().second;

        if (hour > 12) {
          hour = hour - 12;
        }
      });
      digitalclock();
    });
  }
}
