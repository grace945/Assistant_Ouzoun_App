
import 'package:flutter/material.dart';
import '../../../core/constances/colors.dart';
import '../models/settings_item_model.dart';


class SettingsData extends StatelessWidget {
 SettingsData({super.key,required this.item});
    List<SettingsItemModel>item;
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaquery=MediaQuery.of(context);
    final width=_mediaquery.size.width;
    final height=_mediaquery.size.height;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Container(
      padding: EdgeInsets.all(12),
      width:width,
      decoration: BoxDecoration(
        color: isDarkMode?Colors.white10:Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:item.length,
        itemBuilder:(context, index) =>
          InkWell(
            onTap:item[index].onTap,
            child: Row(
              children: [
                Icon(item[index].icon,color: green,size: 20,),
                SizedBox(width:15 ,),
                Text(item[index].itemName,style: Theme.of(context).textTheme.bodyMedium,),
              ],),
          ) ,

       separatorBuilder:(context, index) {
         if(index==0){
           return Divider(color:background, thickness: 1);
         }else{
          return SizedBox(height: 30,);
         }
       },

      ),
    );
  }
}
