import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/constants.dart';

class CustomSearchAppbarContent extends StatelessWidget {
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;

  CustomSearchAppbarContent({this.onChanged, this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.h,
      color: kAppBarColor,
      child: Center(
        child: ListTile(
          leading: Icon(Icons.search),
          title: TextField(
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            style: TextStyle(
              fontSize: 14.sp,
              color: kDrawerTextColor,
              height: 0.19.h,
            ),
            cursorColor: Colors.white,
            autofocus: true,
            autocorrect: false,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
          trailing: IconButton(
            splashRadius: 2.sp,
            icon: Icon(Icons.keyboard_voice),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
