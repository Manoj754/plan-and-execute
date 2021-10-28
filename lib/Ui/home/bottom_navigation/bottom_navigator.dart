import 'package:flutter/material.dart';
import 'package:plan_execute/routes/routes.dart';

class CustomBottomNavController extends ValueNotifier<int> {
  CustomBottomNavController(int value) : super(value);
  void setValue(int val) {
    this.value = val;
  }

  int get val => value;
}

class BottomNavigator extends StatefulWidget {
  final PageController controller;
  final CustomBottomNavController navController;

  BottomNavigator(
      {required this.controller, required this.navController, Key? key})
      : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
    BottomNavigationBarItem(
        icon: Icon(Icons.emoji_objects), label: 'Objective'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
  ];
  int currentIndex = 0;
  @override
  void initState() {
    widget.navController.addListener(() {
      currentIndex = widget.navController.val;
      setState(() {});
      print(currentIndex.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double radius = 25;
    return Card(
      margin: EdgeInsets.zero,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)),
        child: BottomNavigationBar(
          elevation: 10,
          currentIndex: currentIndex,
          items: items,
          onTap: (val) {
            setState(() {
              currentIndex = val;
              widget.controller.jumpToPage(currentIndex);
              // if (val == 2) {
              //   Navigator.popAndPushNamed(context, PageRoutes.signInRoute);
              // }
            });
          },
        ),
      ),
    );
  }
}
