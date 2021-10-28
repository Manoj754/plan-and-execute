import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    emailController.text = "abc@gmail.com";
    nameController.text = "Manoj kargar";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[300]),
                        child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png"),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    EditField(
                      leading: Icons.person_outline_outlined,
                      hint: "Name",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    EditField(
                      leading: Icons.email,
                      hint: "Email",
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: CommonButton(
                        onTap: () {
                          Navigator.maybePop(context);
                        },
                        label: "SUBMIT",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
