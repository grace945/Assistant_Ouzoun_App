

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constances/colors.dart';
import '../controller/settingscontroller.dart';



class SettingsUserData extends StatelessWidget {
  SettingsUserData({super.key,required this.controller,required this.userName,required this.userEmail});
  SettingsController controller ;
  String userName;
  String userEmail;
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
          Obx(() => GestureDetector(
            onTap: () => controller.pickImage(),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: controller.imageFile.value != null
                  ? FileImage(controller.imageFile.value!)
                  : const AssetImage('assets/images/default_avatar.jpg')
              as ImageProvider,
            ),
          )),
          SizedBox(width:20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white70),),
              SizedBox(height: 10,),
              Text(userEmail,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),),
            ],
          )
        ],
      ),
    );
  }
}
