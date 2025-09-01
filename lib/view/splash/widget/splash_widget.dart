import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  String title;
  SplashWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title,style:TextStyle(color:background,fontWeight:FontWeight.w800,fontSize: 50,fontFamily:'Ubuntu' ),),
    );
  }
}