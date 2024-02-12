import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDashBoard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AdminDashBoard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0),
            child: Text(
              'Dashboard',
              style: GoogleFonts.poppins(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 2, 80, 145).withOpacity(1.0),
                  shadows: [
                    Shadow(
                      color:
                          const Color.fromARGB(153, 0, 0, 0).withOpacity(0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Container(
                // Your main body content goes here
                ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
          width: 300,
          height: 70.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: const Color(0xFF4C9ACC),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(24, 0, 0, 0).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.home,
                        color: Colors.white,
                      ),
                      FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.search,
                        color: Colors.white,
                      ),
                      FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.userAlt,
                        color: Colors.white,
                      ),
                      FaIcon(
                        FontAwesomeIcons.gear,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 31, 122, 182),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(64, 0, 0, 0)
                                .withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
