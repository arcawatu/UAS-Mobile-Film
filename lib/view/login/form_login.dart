import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_flutter/constants.dart';
import 'package:movies_app_flutter/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  late bool isLogin = false;
  String mail = 'admin';
  String pass = 'admin';
  Future<bool> login_api() async {
    // Dio dio = Dio();
    // var res = await dio.get("http://localhost:3000/akun");

    //for ech res
    // for (var i = 0; i < res.data.length; i++) {
    //   if (res.data[i]['email'] == email_controller.text &&
    //       res.data[i]['password'] == password_controller.text) {
    //     print('login success');
    //     setState(() {
    //       isLogin = true;
    //     });
    //   } else 
      if (mail == email_controller.text &&
          pass == password_controller.text) {
        print('login success');
        setState(() {
          isLogin = true;
        });
      }else{
        print('login failed');
        isLogin = false;
      }
    // }
    return isLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // padding: const EdgeInsets.all(24.0),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Selamat Kembali",
                    style: TextStyle(
                      color: w_unggu1,
                      fontFamily: 'Poppins Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text("Ayo masukan kembali akun mu! ",
                      style: TextStyle(
                        color: w_biru,
                        fontSize: 17,
                        fontFamily: 'Poppins Light',
                      )),
                ],
              ),
            ),
            SizedBox(height: 25),
            //////////////////////Sudah
            // Text('Login Screen'),
            TextField(
              controller: email_controller,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: customGrey),
              decoration: InputDecoration(
                icon: Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Alamat Email",
                hintText: "Alamat Email",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: password_controller,
              obscureText: true,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: customGrey),
              decoration: InputDecoration(
              icon: Icon(Icons.key),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                //grey borderside
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: customGrey),
                  borderRadius: BorderRadius.circular(12),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: Text('password',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: customGrey)),
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 44,
                  ),
                  Text(
                    "Lupa kata sandi?",
                    style: TextStyle(
                      color: w_biru,
                      fontSize: 16,
                      fontFamily: 'Poppins Light',
                    ),
                  ),
                ],
              ),
            ),
            //-------------------------------------------------------------------------------------
            Spacer(),
            ElevatedButton(
              onPressed: () {
                ///awas
                login_api().then((value) {
                  if (value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.greenAccent,
                        content: Text('Login Success')));
                  } else {
                    //create snackbar
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text('Login GAGAL Guys')));
                  }
                });
                setState(() {});
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tidak punya akun?",
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: w_unggu1,
                    )),
                SizedBox(width: 7),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //   builder: (context) => SignUp(),
                    // ));
                  },
                  child: Text("Sign up",
                      style: TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                        color: w_biru,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
