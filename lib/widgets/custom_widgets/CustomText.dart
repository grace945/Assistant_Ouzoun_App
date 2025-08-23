import 'package:flutter/cupertino.dart';

class Customtext extends StatelessWidget {
   final int max;
  final String fontFamily;
  final double fontSize;
  final bool isbold;
  final TextAlign textAlign;
  final Color color;
  final String text;
   Customtext({super.key,
     this.max=2,
    required this.fontFamily,
    required this.fontSize
    , required this.isbold,
    required this.color,
    required this.text,
     required this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
    maxLines: max,
    style: TextStyle(
      fontSize:fontSize,
      fontFamily: fontFamily,
      fontWeight: isbold?FontWeight.bold:FontWeight.normal,
      color: color,
    ),
        textAlign: textAlign,
    );
  }
}
