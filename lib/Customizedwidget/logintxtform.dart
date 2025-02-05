import 'package:flutter/material.dart';
class logintxtform  extends StatelessWidget {
  String? lbl;
  String? hint;
  Icon? preIcon;
  Icon? sufIcon;
  String? Function(String?)? v;
  logintxtform({required this.lbl,required this.hint,required this.preIcon,this.sufIcon,this.v, required TextEditingController controller,});
  @override

  Widget build(BuildContext context) {
    return  TextFormField(style: TextStyle(color: Colors.white,fontSize: 27),cursorColor: Colors.white,
      validator: v,
      decoration: InputDecoration(
        label: Text(lbl!,style: TextStyle(color: Colors.white),),
        prefixIcon: preIcon,
        suffixIcon: sufIcon ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
          ),
        ),

        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange.shade300,width: 3)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 3)
        ),
      ),

    );
  }
}
