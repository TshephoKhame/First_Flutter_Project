import 'dart:async';
import 'package:first_flutter_project/App.dart';
import 'package:first_flutter_project/register.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final TextEditingController userController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 60),
                      TextFormField(
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _navigateToMainApp(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Dont have an account?"),
                            TextButton(
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const register(),
                                ),
                              ),
                              child: const Text("Register"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _navigateToMainApp(BuildContext context) {
  if (userController.text != "Tshepho" &&
      passwordController.text != 'Password') {
    _showToast(context, 0);
  } else {
    _showToast(context, 1);
  }
}

void _showToast(BuildContext context, int check) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          Text(
            check == 1 ? 'Logging In' : 'Wrong Credentials',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: check == 1 ? Colors.green.shade300 : Colors.red.shade500,
      duration: const Duration(milliseconds: 4500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      margin: EdgeInsets.only(
          bottom: _fullHeightPage(context) - 100,
          left: _quarterWidthPage(context),
          right: _quarterWidthPage(context)),
      onVisible: check == 1
          ? () => Timer(
                const Duration(seconds: 5),
                () {
                  _goToMainApp(context);
                },
              )
          : null,
    ),
  );
}

double _quarterWidthPage(context) {
  return MediaQuery.of(context).size.width * 0.1;
}

double _fullHeightPage(context) {
  return MediaQuery.of(context).size.height;
}

void _goToMainApp(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => const mainApp(),
    ),
  );
}
