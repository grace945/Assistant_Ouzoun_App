

import 'package:flutter/material.dart';

class OnBoardingDetails extends StatelessWidget {
  OnBoardingDetails({super.key,required this.title,required this.url,required this.body});
  String title;
  String body;
  String url;

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery= MediaQuery.of(context);
    final height= _mediaQuery.size.height;
    final width =_mediaQuery.size.width;
    final isportrait=_mediaQuery.orientation==Orientation.portrait;
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body:Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Text(title,style:Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
            SizedBox(height: height * 0.03),
            Text(body, textAlign: TextAlign.center, style:Theme.of(context).textTheme.titleMedium,),
            SizedBox(height:height * 0.07),

            Image.asset(url, fit: BoxFit.cover,scale:0.5,),
          ],
        ),
      ),
    );
  }
}
