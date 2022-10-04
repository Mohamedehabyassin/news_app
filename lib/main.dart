import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NEWS',
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
