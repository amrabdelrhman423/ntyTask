import 'package:flutter/material.dart';
import 'package:nyt/core/dio_util.dart';

import 'Screens/Home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Nty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
