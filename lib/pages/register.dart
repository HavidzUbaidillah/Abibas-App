import 'package:abibas_app/controller/registration.dart';
import 'package:abibas_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:abibas_app/components/const.dart';
import 'package:get/get.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Abibas App',
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/home':(context) => const HomePage()
    },
  ));
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPasswordVisible = false;
  RegisterationController registerationController =
      Get.put(RegisterationController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Abibas App',
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
                  "REGISTER",
                  style: kHeadline,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65),
                    child: Text(
                      'Email',
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
                      controller: registerationController.emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
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
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 5),
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
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: TextField(
                      style: const TextStyle(color: kBackgroundColor),
                      controller: registerationController.nameController,
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
              const SizedBox(height: 10),
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
                      controller: registerationController.passwordController,
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
                  onPressed: () async {
                    await registerationController.register();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                  ),
                  child: const Text(
                    'Sign Up',
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
                  Navigator.pushNamed(context, '/login');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Back to Login",
                    style: TextStyle(
                      color: kBackgroundColor,
                      decoration: TextDecoration.underline,
                    ),
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
