import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';

class EditField extends StatelessWidget {
  final IconData? leading;
  final String? hint;
  final double? radius;
  final TextEditingController? controller;
  const EditField(
      {this.leading, this.controller, this.hint, Key? key, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      cursorColor: primaryColor,
      style: theme.textTheme.subtitle2,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIconConstraints: BoxConstraints(minHeight: 60, minWidth: 60),
        prefixIcon: leading == null
            ? null
            : Icon(
                leading,
              ),
        hintText: hint,
        hintStyle: theme.textTheme.subtitle1,
        focusColor: primaryColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 100),
            borderSide: BorderSide(color: primaryColor, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 100),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final IconData? leading;
  final String? hint;
  final TextEditingController? controller;
  const SearchField({this.leading, this.controller, this.hint, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(8),
        prefixIconConstraints: BoxConstraints(minHeight: 60, minWidth: 60),
        prefixIcon: Icon(
          leading,
        ),
        hintText: hint,
        hintStyle: theme.textTheme.subtitle1,
        focusColor: primaryColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: primaryColor, width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: primaryColor, width: 1.5)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: primaryColor, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: primaryColor)),
      ),
    );
  }
}
