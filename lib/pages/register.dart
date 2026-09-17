import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/pages/login.dart';
import 'package:loginpages/shared/colors.dart';
import 'package:loginpages/shared/constant.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/register1.png", height: 300),

                SizedBox(height: 64),

                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: decorationTextField.copyWith(
                    hintText: "Enter Your username",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                SizedBox(height: 33),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextField.copyWith(
                    hintText: "Enter Your Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                SizedBox(height: 33),

                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: decorationTextField.copyWith(
                    hintText: "Enter Your Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility_off),
                    ),
                  ),
                ),

                SizedBox(height: 33),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(BTNgreen),

                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),

                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(height: 33),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
