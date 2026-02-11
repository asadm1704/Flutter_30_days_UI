import 'package:flutter/material.dart';
import 'package:own_practice/widgets/Container_size.dart';
import 'package:own_practice/widgets/rows_cols.dart';

void main()=>runApp(new MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        brightness: Brightness.light,
        primaryColor:Colors.blueAccent,
      ),
      home:Rows_Cols(),
    );
  }
}