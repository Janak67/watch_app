import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  int hour = 0, minutes = 0, second = 0, day = 0, month = 0, year = 0,week=0;

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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.60,
                width: MediaQuery.of(context).size.width * 0.60,
                child: CircularProgressIndicator(
                  value: hour / 12,
                  strokeWidth: 10,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.55,
                width: MediaQuery.of(context).size.width * 0.55,
                child: CircularProgressIndicator(
                  value: minutes / 60,
                  strokeWidth: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.50,
                width: MediaQuery.of(context).size.width * 0.50,
                child: CircularProgressIndicator(
                  value: second / 60,
                  strokeWidth: 10,
                  color: Colors.green,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$week",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$day - $month - $year',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$hour - $minutes - $second",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ],
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
        week = DateTime.now().weekday;
        day = DateTime.now().day;
        month = DateTime.now().month;
        year = DateTime.now().year;

        if (hour > 12) {
          hour = hour - 12;
        }
      });
      digitalclock();
    });
  }
}
