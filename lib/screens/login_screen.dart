import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'register_screen.dart';
import 'admin_dashboard.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    const String url = 'https://iemkaksha.in/api/api-fetch-single.php';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'success') {
        if (kDebugMode) {
          print('Login successful');

          // Navigate to AdminDashboard screen on successful login
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const AdminDashBoard()),
          );
        }
      } else {
        if (kDebugMode) {
          print('Login failed: ${data['message']}');
          // Navigate to AdminDashboard screen on successful login
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const AdminDashBoard()),
          );
        }
      }
    } else {
      if (kDebugMode) {
        print('HTTP Error: ${response.reasonPhrase}');
        // Navigate to AdminDashboard screen on successful login
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const AdminDashBoard()),
        );
      }
    }
  }

  void navigateToRegisterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 215),
                  Text(
                    "IEM KAKSHA",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Welcome! Please Login into Your Account",
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 32),
                  buildInputContainer(
                    controller: emailController,
                    labelText: 'Email',
                    icon: FontAwesomeIcons.envelope,
                  ),
                  const SizedBox(height: 16),
                  buildInputContainer(
                    controller: passwordController,
                    labelText: 'Password',
                    icon: FontAwesomeIcons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: navigateToRegisterScreen,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Don't have an Account? Create One",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  buildLoginButton(),
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
          Positioned(
            top: 28,
            right: -2,
            left: 20,
            child: Image.asset(
              'assets/upper_pattern.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
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

  Container buildInputContainer({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool isPassword = false,
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
              obscureText: isPassword,
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

  Container buildLoginButton() {
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
        onPressed: loginUser,
        child: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
