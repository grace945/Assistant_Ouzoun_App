
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';



class Customotp extends StatelessWidget {
  Customotp({super.key, required this.onChanged,required this.codenumber,required this.focusedbordercolor,required this.cursorcolor,required this.keybord});
  Color cursorcolor;
  Color focusedbordercolor;
  int codenumber;
  TextInputType keybord;
  final Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery=MediaQuery.of(context);
    final height= _mediaQuery.size.height;
    final width =_mediaQuery.size.width;
    final isportrait=_mediaQuery.orientation==Orientation.portrait;
    return OtpTextField(
      numberOfFields: codenumber,
      cursorColor:cursorcolor,
      focusedBorderColor:focusedbordercolor,
      keyboardType:keybord,
      autoFocus: true,
      showFieldAsBox: true,
      onCodeChanged:onChanged,
      //runs when every textfield is filled
      /* onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            },*/ // end onSubmit
    );

  }
}