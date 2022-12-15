import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/constants.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationItem> children;
  final int index;
  final Color activeColor;

  BottomNavigation({
    required this.children,
    required this.index,
    required this.activeColor,
  }) {
    children[index].color = activeColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kAppBarColor,
        // boxShadow: kBoxShadow,
      ),
      height: 11.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final Icon icon;
  final double iconSize;
  final Function? onPressed;
  Color? color;

  BottomNavigationItem({
    required this.icon,
    required this.iconSize,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: iconSize,
        color: color ?? kInactiveButtonColor,
        onPressed: () => onPressed!(),
        icon: icon);
  }
}
