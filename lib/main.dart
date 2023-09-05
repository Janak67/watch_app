import 'package:drawer/Screen/clock_screen.dart';
import 'package:drawer/Screen/drawer.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Clock(),
    ),
  );
}