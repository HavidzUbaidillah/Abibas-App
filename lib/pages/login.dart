import 'package:abibas_app/controller/login.dart';
import 'package:get/get.dart';

import 'register.dart';
import 'package:flutter/material.dart';
import 'package:abibas_app/components/const.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Abibas App',
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/home': (context) => const HomePage(),
    },
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Abibas App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/download.png',
                width: 250,
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "LOGIN",
                  style: kHeadline,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65),
                    child: Text(
                      'Username',
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                    child: TextField(
                      style: const TextStyle(color: kBackgroundColor),
                      controller: loginController.usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: kBodyText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kBackgroundColor, width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kBackgroundColor, width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 5),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: TextField(
                      style: const TextStyle(color: kBackgroundColor),
                      controller: loginController.passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: kBodyText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kBackgroundColor, width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kBackgroundColor, width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        suffixIcon: IconButton(
                          onPressed: () {
                            // Toggle show/hide password
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () => loginController.login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Didn't have an account? Register",
                    style: TextStyle(
                        color: kBackgroundColor,
                        decoration: TextDecoration.underline,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
