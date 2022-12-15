// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:movies_app_flutter/constants.dart';

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/view/login/form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/back.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 207, 35, 35),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('image/popcorn.png'),
            Container(
              // margin: EdgeInsets.only(top: 150),
              padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
              // decoration: BoxDecoration(color: w_abu),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                    },
                    child: Text("SIGN IN",
                        style: TextStyle(
                          fontFamily: 'Poppins Bold',
                          fontSize: 18,
                        )),
                    style: ElevatedButton.styleFrom(
                        primary: w_unggu,
                        minimumSize: const Size.fromHeight(55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
