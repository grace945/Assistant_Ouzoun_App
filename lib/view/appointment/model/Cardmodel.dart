import 'package:flutter/cupertino.dart';

class Cardmodel {
  IconData icon;
  String name;
  final Widget Function() navigateTo;
  final Future<void> Function()? fetchData;
  Cardmodel( {required this.name,required this.icon,required this.navigateTo,required this.fetchData});
}