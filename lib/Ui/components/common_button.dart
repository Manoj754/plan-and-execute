import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const CommonButton({this.label = "", this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onTap,
        focusColor: Colors.red,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 60),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: lightColor),
          ),
        ),
      ),
    );
  }
}
