import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminDashBoard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AdminDashBoard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Set background color to white
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
          width: 300, // Reduce size horizontally
          height: 70.0, // Adjusted height
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), // Add rounded corners
              color: const Color(0xFF4C9ACC), // Color #4c9acc
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(24, 0, 0, 0).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(2, 2), // Shadow offset
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 45.0), // Add padding to widen the bar
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
                        FontAwesomeIcons
                            // ignore: deprecated_member_use
                            .userAlt, // This will give you the user icon
                        color: Colors.white,
                      ),
                      FaIcon(
                        FontAwesomeIcons.gear,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(
                        0, -30), // Shift the circle shape upwards by 20px
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
                            offset: const Offset(0, 2), // Shadow offset
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
