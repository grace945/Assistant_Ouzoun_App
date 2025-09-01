import 'package:flutter/cupertino.dart';

class SettingsItemModel {
  IconData icon;
  String itemName;
  VoidCallback?onTap;
  final Widget? trailing;
  SettingsItemModel({required this.icon,required this.itemName,required this.onTap, this.trailing });
}