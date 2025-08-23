import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(color:green),
  colorScheme: ColorScheme.light(background:background),
  primaryColor:green,
  buttonTheme:ButtonThemeData(buttonColor:green),
  textTheme: TextTheme(
    headlineLarge:TextStyle(fontFamily: 'Montserrat', fontSize: 17, fontWeight: FontWeight.bold, color:background,),
    headlineMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 15, color:background),
    headlineSmall:TextStyle(fontFamily: 'Montserrat', fontSize: 15, color:black,fontWeight:FontWeight.bold),
    titleLarge:TextStyle(color:black,fontFamily:'Ubuntu',fontWeight:FontWeight.bold,fontSize:25),
    titleMedium: TextStyle(fontFamily:'Montserrat',color:Colors.grey,fontSize:15),
    titleSmall: TextStyle(fontFamily:'Montserrat',color:Colors.black,fontSize:20,fontWeight:FontWeight.bold,),
    bodyLarge: TextStyle(fontFamily:'Montserrat',color:Colors.black,fontSize:20),
    bodyMedium: TextStyle(fontFamily:'Montserrat',color:Colors.grey,fontSize:15),
    bodySmall: TextStyle(fontFamily:'Montserrat',color:notes,fontSize:13),
  ),);
ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(color:green),
  colorScheme: ColorScheme.dark(background:black),
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 17, fontWeight: FontWeight.bold, color:background,),
    headlineMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 15, color:greenlight),
    headlineSmall:TextStyle(fontFamily: 'Montserrat', fontSize: 15, color:background,fontWeight:FontWeight.bold),
    titleLarge:TextStyle(color:background,fontFamily:'Ubuntu',fontWeight:FontWeight.bold,fontSize:25),
    titleMedium:TextStyle(fontFamily:'Montserrat',color:greenlight,fontSize:15),
    titleSmall: TextStyle(fontFamily:'Montserrat',color:Colors.green,fontSize:20,fontWeight:FontWeight.bold,),
    bodyLarge: TextStyle(fontFamily:'Montserrat',color:Colors.white,fontSize:20),
    bodyMedium: TextStyle(fontFamily:'Montserrat',color:Colors.grey,fontSize:15),
    bodySmall: TextStyle(fontFamily:'Montserrat',color:notes,fontSize:13),
  ),

);
