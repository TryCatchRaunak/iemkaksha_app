import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController iemcrpidController = TextEditingController();
  final TextEditingController biometricidController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterScreen({super.key});

  get context => null;

  Future<void> register() async {
    const String url =
        'https://iemkaksha.in/api/api-insert.php'; // Replace with your PHP API URL

    final Map<String, String> data = {
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'iemcrpid': iemcrpidController.text,
      'biometricid': biometricidController.text,
      'password': passwordController.text,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Handle success, you can parse the response if needed
      if (kDebugMode) {
        print('Registration Successful!');
      }
    } else {
      // Handle error
      if (kDebugMode) {
        print('Registration failed');
      }
      if (kDebugMode) {
        print(response.body);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    "IEM KAKSHA",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 48.0,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Please Register as a New Teacher!",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: const Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 16),
                  buildInputContainer(
                    context,
                    labelText: 'Name',
                    icon: FontAwesomeIcons.user,
                    controller: nameController,
                  ),
                  const SizedBox(height: 16),
                  buildInputContainer(
                    context,
                    labelText: 'Email',
                    icon: FontAwesomeIcons.envelope,
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  buildInputContainer(
                    context,
                    labelText: 'Phone No.',
                    icon: FontAwesomeIcons.phone,
                    controller: phoneController,
                  ),
                  const SizedBox(height: 16),
                  buildInputContainer(
                    context,
                    labelText: 'IEM CRP ID',
                    icon: FontAwesomeIcons.idCard,
                    controller: iemcrpidController,
                  ),
                  const SizedBox(height: 16),
                  buildInputContainer(
                    context,
                    labelText: 'Biometric ID',
                    icon: FontAwesomeIcons.fingerprint,
                    controller: biometricidController,
                  ),
                  const SizedBox(height: 16),
                  buildInputContainer(
                    context,
                    labelText: 'Password',
                    icon: FontAwesomeIcons.lock,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 52),
                  buildRegisterButton(context),
                  const SizedBox(height: 30),
                  Text(
                    "Already a User?",
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff000000)),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      // Navigate back to the login screen
                      Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromARGB(246, 83, 4, 230)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 28,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Image.asset(
        'assets/lower_pattern.png',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  Container buildInputContainer(
    BuildContext context, {
    required String labelText,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Container(
      width: 0.85 * MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: labelText,
                hintStyle: const TextStyle(color: Colors.black),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              icon,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Container buildRegisterButton(BuildContext context) {
    return Container(
      width: 0.85 * MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF392F81), Color(0xFF314CAD)],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextButton(
        onPressed: () {
          register(); // Call the register function when the button is pressed
        },
        child: const Text(
          "REGISTER",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
