import 'package:flutter/material.dart';

import 'features/teacher/screen/teacher_screen.dart';
import 'features/coding/screen/coding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int currentIndex = 0;

  final screens = const [
    TeacherScreen(),
    CodingScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        body: screens[currentIndex],

        bottomNavigationBar:
            BottomNavigationBar(

          currentIndex: currentIndex,

          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Teacher",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              label: "Coding",
            ),
          ],
        ),
      ),
    );
  }
}