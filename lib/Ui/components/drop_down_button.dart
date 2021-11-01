import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';

class CustomDropDownButton extends StatefulWidget {
  final dynamic currentValue;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem<dynamic>>? items;
  final double? radius;
  CustomDropDownButton(
      {Key? key,
      required this.currentValue,
      required this.items,
      this.radius,
      this.onChanged})
      : super(key: key);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.radius ?? 100)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButton(
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: darkTextColor.withOpacity(.7)),
          isExpanded: true,
          elevation: 1,
          underline: Container(),
          value: widget.currentValue,
          items: widget.items!,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
