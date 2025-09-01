import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constances/colors.dart';
import 'custom_text.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.onTap, required this.text, required this.color,});
  final Function onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:green,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height:MediaQuery.of(context).size.height * 0.07 ,
      child: InkWell(
        onTap: (){
          onTap!();
        },
        child:Center(
          child:Text(text,style:Theme.of(context).textTheme.headlineLarge,)
        ),
      ),
    );
  }
}
