import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback onPressed;
  final String? title;

  const CustomButton({super.key,this.icon,this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF34C8E8), // Start color
            Color(0xFF4E4AF2), // End color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Transparent to show gradient
          shadowColor: Colors.transparent, // Remove shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: (title==null)
            ? Icon(icon?.icon, color: Colors.white, size: 24)
            : Text(title!, style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
