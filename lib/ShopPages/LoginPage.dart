// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop/Components/my_button.dart';
import 'package:shop/Components/my_textfield.dart';
import 'package:shop/Components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void signuserin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome back you've been missd",
                style: TextStyle(color: Colors.grey[7000], fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              MyTextField(
                controller: usernamecontroller,
                hintText: 'Username',
                obscureText: false,
              ),
              SizedBox(
                height: 25,
              ),
              MyTextField(
                controller: passwordcontroller,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('forgot password'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyButton(
                onTap: signuserin,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('or continue with'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagepath: 'lib/images/google.png'),
                  SizedBox(
                    height: 30,
                    width: 50,
                  ),
                  SquareTile(imagepath: 'lib/images/apple.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
