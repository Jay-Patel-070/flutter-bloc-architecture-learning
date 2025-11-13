import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningbloc/features/counter/counter_screen.dart';
import 'package:learningbloc/features/darklightmode/light_screen.dart';
import 'package:learningbloc/features/login/login_screen.dart';
import 'package:learningbloc/features/todo/todo_screen.dart';
import 'package:learningbloc/features/users/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: UserScreen(),
    );
  }
}
