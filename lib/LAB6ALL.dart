import 'package:flutter/material.dart';
import 'package:untitled/HomeScreen.dart';
import 'package:untitled/ListViewScreen.dart';
import 'package:untitled/GridViewScreen.dart';



void main (){
  runApp(const MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext){
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'mad lab of navigation , routing , grid and list view ',
      initialRoute: '/',
      routes: {
        '/':(context) => const HomeScreen(),
        '/list':(context) => const ListViewScreen(),
        '/grid':(context) => const GridViewScreen(),

      },
    );
  }
}

