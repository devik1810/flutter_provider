import 'package:flutter/material.dart';
import 'package:flutter_provider/screen/provider/home_provider.dart';
import 'package:flutter_provider/screen/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Homescreen(),
        },
      ),
    ),
  );
}
