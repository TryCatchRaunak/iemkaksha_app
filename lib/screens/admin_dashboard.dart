import 'package:flutter/material.dart';

class AdminDashBoard extends StatelessWidget {
  const AdminDashBoard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/admin_dashboard_background.png',
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),

          // Your UI on top of the background
        ],
      ),
    );
  }
}
