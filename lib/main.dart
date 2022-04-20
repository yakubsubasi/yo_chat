import 'package:flutter/material.dart';

import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(darkTheme: ThemeData.dark() ,
      title: 'Yo App',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: const HomePage()
    );
  }
}
