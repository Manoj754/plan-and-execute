import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/signIn_page.dart';

class ShowObjectivePage extends StatelessWidget {
  const ShowObjectivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: backGroundDecoration,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: size.width * .3,
                    child: Text("Name"),
                  ),
                  SizedBox(
                    width: size.width * .3,
                    child: Text("Name"),
                  ),
                  SizedBox(
                    width: size.width * .3,
                    child: Text("Name"),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(":"),
                  Text(":"),
                  Text(":"),
                ],
              ),
              Column(
                children: [
                  Text(":"),
                  Text(":"),
                  Text(":"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
