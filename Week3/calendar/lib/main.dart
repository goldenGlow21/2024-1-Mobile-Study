import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'PretendardBold',
      ),
      home: const MyHomePage(title: "GDSC 모바일 스터디"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 700,
              padding: EdgeInsets.all(10),
              child: Text("과제", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,), textAlign: TextAlign.start),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("오늘의 과제", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800,)),
                    SizedBox(height: 20),
                    Icon(Icons.book_outlined, size: 90)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("수행한 과제", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800,)),
                    SizedBox(height: 20),
                    Icon(Icons.collections_bookmark_outlined, size: 90)
                  ],
                ),
              ],
            ),  //과제 - 오늘의 과제 & 수행한 과제

            SizedBox(
              width: 700,
              height: 20
            ),

            Container(
              width: 700,
              padding: EdgeInsets.all(20),
              child: Text("나의 수행도", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,), textAlign: TextAlign.start),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 3, 2),
              lastDay: DateTime.utc(2040, 2, 4),
              focusedDay: DateTime.now(),
            ),

            Container(
              width: 700,
              padding: EdgeInsets.all(20),
              child: Text("나의 다짐", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,), textAlign: TextAlign.start),
            ),
            Container(
              width: 700,
              padding: EdgeInsets.all(10),
              child: Text("열심히 살자", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800,), textAlign: TextAlign.start),
            ),
          ],
        )
      )
    );
  }
}
