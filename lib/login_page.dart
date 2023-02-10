import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              final String email = emailController.text;
              final String password = passwordController.text;

              if (email.isEmpty) {
                print('togri l  ');
              } else {
                context.read<AuthController>().login(email, password);
              }
            },
            child: Text('Log in'),
          ),
          FloatingActionButton(
            onPressed: () {
              final String email = emailController.text;
              final String password = passwordController.text;

              if (email.isEmpty) {
                print('togri l  ');
              } else {
                context
                    .read<AuthController>()
                    .siginUp(email, password)
                    .then((value) async {
                  User? user = FirebaseAuth.instance.currentUser;
                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(user?.uid)
                      .set({
                    'uid': user?.uid,
                    'email': email,
                    'password': password,
                    'image': user?.photoURL
                  });
                });
              }
            },
            child: Text('Sigin up'),
          )
        ],
      ),
    );
  }
}
