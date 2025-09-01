

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constances/colors.dart';
import '../controller/settings_controller.dart';



class SettingsUserData extends StatelessWidget {
  SettingsUserData({super.key,required this.controller,required this.userName,required this.userEmail,required this.number,required this.image});
  SettingsController controller ;
  String userName;
  String userEmail;
  String number;
  String image;
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaquery=MediaQuery.of(context);
    final width=_mediaquery.size.width;
    final height=_mediaquery.size.height;
    return  Container(
      padding: EdgeInsets.all(12.0),
      width:width,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: green,
      ),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(image)
              as ImageProvider,
            ),

          SizedBox(width:20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white70),),
              SizedBox(height: 10,),
              Text(userEmail,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),),
              SizedBox(height: 10,),
              Text(number,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),),
            ],
          )
        ],
      ),
    );
  }
}
