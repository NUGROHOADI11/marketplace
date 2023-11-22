import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/controllers/auth_controller.dart';

class UserScreen extends StatelessWidget {
  final authControl = Get.find<AuthController>();

  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Your person screen implementation
    return InkWell(
      onTap: () => authControl.logout(),
      child: Container(
          height: 50,
          width: 900,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xFF230C02)),
          child: Center(
            child: Text(
              "Logout",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          )),
    );
  }
}
