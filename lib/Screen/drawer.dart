import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Appbar Demo"),
          actions: [
            IconButton(
                onPressed: () {
                  _scaffoldkey.currentState!.openEndDrawer();
                },
                icon: Icon(Icons.person))
          ],
          backgroundColor: Colors.red,
        ),
        key: _scaffoldkey,
        endDrawer: Drawer(
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/image/Profile.png"),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.grey.shade500,
              )
            ],
          ),
        ),
      ),
    );
  }
}