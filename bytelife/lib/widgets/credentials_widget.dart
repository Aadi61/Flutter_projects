import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CredentialsWidget extends StatelessWidget {
  
  final String credential_type;
  final bool obscureText;
  const CredentialsWidget(
     {
     super.key,
     required this.credential_type,
     required this.obscureText
     }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5,horizontal: 20),
      child: Column(
        children: <Widget> [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(credential_type, style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 12)),
            )),
          TextField(
            obscureText: obscureText,
             decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.black)
            ),
         fillColor: Colors.grey[350],
         filled: true
         ),
          )
        ],
      ),
    );
  }
}