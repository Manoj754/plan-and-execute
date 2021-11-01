import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';

class CustomDatePicker extends StatefulWidget {
  final double? radius;
  final DateTime? date;
  final Function(DateTime date)? onDateChange;
  CustomDatePicker({Key? key, this.radius, this.date, this.onDateChange})
      : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  @override
  void initState() {
    selectedDate = widget.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.radius ?? 100)),
      child: InkWell(
        onTap: () async {
          final res = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 360)));
          selectedDate = res;
          if (res != null) {
            if (widget.onDateChange != null) {
              widget.onDateChange!(res);
            }
          }
          // widget.onDateChange(selectedDate)
          setState(() {});
          print(res.toString());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                selectedDate == null
                    ? " DD-MM-YYYY"
                    : selectedDate!.getFormated(),
                style: selectedDate == null
                    ? theme.subtitle1
                    : theme.subtitle1!
                        .copyWith(color: darkTextColor.withOpacity(.7)),
              )),
              Icon(
                Icons.calendar_today,
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension dateExtention on DateTime {
  String getFormated() {
    return this.day.toString() +
        "-" +
        this.month.toString() +
        "-" +
        this.year.toString();
  }
}
