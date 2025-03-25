import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../theme/colors.dart';
import 'bottom_Navigation_Bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      String email = _emailController.text.toString();
      String password = _passwordController.text.toString();
      String fcmToken = "";
      // Create JSON data
      Map<String, dynamic> requestData = {
        'username_or_email': email,
        'password': password,
        'fcmToken': fcmToken,
      };

      String jsonData = jsonEncode(requestData);
      // Perform login action (API call or authentication)
      try {
        Response response = await post(
            Uri.parse("https://cooklikeme2.azurewebsites.net/api/users/login"),
            headers: {'Content-Type': 'application/json'},
            body: jsonData);
        setState(() => _isLoading = false);
        if (response.statusCode == 200) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const BottomNavScreen()));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                  'Login Successful',
                  style: TextStyle(color: Colors.white),
                )),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Login not Successful',
                    style: TextStyle(color: Colors.white))),
          );
        }
      } catch (e) {
        setState(() => _isLoading = false);
      }

      if (kDebugMode) {
        print("Email: $email, Password: $password");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColor.backgroundColor2.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 104),
              child: Center(
                  child: Image.asset(
                    "assets/SplashScreen.png",
                    width: 280,
                    height: 212,
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Theme(
                data: ThemeData(
                  inputDecorationTheme: const InputDecorationTheme(
                    errorStyle: TextStyle(
                        color: Colors.white), // Change all error text colors
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: UiColor.formColor,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: UiColor.formColor,
                          ),
                          labelText: "Email/Username",
                          prefixIcon: const Icon(
                            Icons.email,
                            color: UiColor.formColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        cursorColor: UiColor.formColor,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: UiColor.formColor,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: UiColor.formColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: UiColor.formColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: UiColor.textColor),
                            )),
                      ),
                      const SizedBox(height: 40),

                      // Login Button
                      SizedBox(
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: UiColor.textColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                              color: Colors.white)
                              : const Text("Sign-In",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "I don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign-Up",
                                style: TextStyle(color: UiColor.textColor),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
