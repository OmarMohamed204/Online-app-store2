import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/pages/login.dart';
import 'package:loginpages/shared/colors.dart';
import 'package:loginpages/shared/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final user = credential.user!;

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': usernameController.text.trim(),
        'email': emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      await Future.delayed(const Duration(milliseconds: 500));

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Registration failed")),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: decorationTextField.copyWith(
                    hintText: l10n.enterUsername,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                SizedBox(height: 33),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextField.copyWith(
                    hintText: l10n.enterEmail,
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                SizedBox(height: 33),

                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: isPasswordHidden,
                  decoration: decorationTextField.copyWith(
                    hintText: l10n.enterPassword,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 33),

                ElevatedButton(
                  onPressed: registerUser,
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
                    l10n.register,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),

                SizedBox(height: 33),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.haveAccount,
                      style: TextStyle(fontSize: 18, color: Colors.black),
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
                        l10n.signIn,
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
