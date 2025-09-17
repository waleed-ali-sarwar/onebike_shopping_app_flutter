import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_button.dart';

class CustomAppbar extends StatelessWidget{
  final String text_title;
  final Icon? icon;
  final VoidCallback onPressed;
  const CustomAppbar({super.key,required this.text_title,this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 50,left:20),
      child: Row(
        children: [
          CustomButton(icon: icon, onPressed: onPressed),
          SizedBox(width: 40,),
          Text(
            text_title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
              textBaseline: TextBaseline.alphabetic,
              fontWeight: FontWeight.bold,

            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}