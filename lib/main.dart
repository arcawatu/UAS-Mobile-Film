import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'view/login/login.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.dark().copyWith(
            platform: TargetPlatform.iOS,
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryColor,
          ),
          home: LoginPage(
          // home: LoginPage(
            key: kHomeScreenKey,
          ),
        );
      },
    );
  }
}
