import 'package:flutter/material.dart';

//
class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Edit_screen(
                            name: "Manoj.kargar005",
                            image:
                                "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
                          )));
                },
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.1,
                          width: size.width * 0.23,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png"),
                              ),
                              color: Colors.grey[300]),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 0,
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Manoj.kargar005",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Active"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                contentPadding: EdgeInsets.only(left: 10),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                leading: Icon(
                  Icons.notifications_none,
                ),
                title: Text(
                  "Notification",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
                height: 0,
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                contentPadding: EdgeInsets.only(left: 10),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                leading: Icon(
                  Icons.sms_outlined,
                ),
                title: Text(
                  "Chat Notification",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
                height: 0,
              ),
              ListTile(
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: size.width * .9,
                                  height: size.height * 0.31,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Change Password",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),

                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300],
                                        ),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "Old Password"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300],
                                        ),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "New Password"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Container(
                                                      width: size.width * .9,
                                                      height:
                                                          size.height * 0.31,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors.grey[100],
                                                      ),
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Center(
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          25),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[100],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 50,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .grey,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            "https://cdn-icons-png.flaticon.com/512/190/190411.png"),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Great!",
                                                                    style: (TextStyle(
                                                                        letterSpacing:
                                                                            1)),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Tour Password Has Been \nSuccessfully Updated.",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .button!
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            letterSpacing: 1),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                Alignment(
                                                                    1.05, -1.1),
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      200],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Icon(
                                                                  Icons.close,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.blue,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Update",
                                            style: Theme.of(context)
                                                .textTheme
                                                .button!
                                                .copyWith(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.symmetric(
                                      //       horizontal: 20),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceAround,
                                      //     children: [
                                      //       Container(
                                      //         height: 40,
                                      //         width: 40,
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     10),
                                      //             color: Colors.grey[300]),
                                      //       ),
                                      //       Container(
                                      //         height: 40,
                                      //         width: 40,
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     10),
                                      //             color: Colors.grey[300]),
                                      //       ),
                                      //       Container(
                                      //         height: 40,
                                      //         width: 40,
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     10),
                                      //             color: Colors.grey[300]),
                                      //       ),
                                      //       Container(
                                      //         height: 40,
                                      //         width: 40,
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     10),
                                      //             color: Colors.grey[300]),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // Center(
                                      //     child: Text(
                                      //         "Enter your OTP code here")),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     Navigator.of(context).pop();
                                      //     showDialog(
                                      //         barrierDismissible: false,
                                      //         context: context,
                                      //         builder: (context) {
                                      //           return AlertDialog(
                                      //             elevation: 0,
                                      //             backgroundColor:
                                      //                 Colors.transparent,
                                      //             shape:
                                      //                 RoundedRectangleBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(
                                      //                                 15)),
                                      //             content: Container(
                                      //               height: 228,
                                      //               child: Stack(
                                      //                 children: <Widget>[
                                      //                   Container(
                                      //                     padding: EdgeInsets
                                      //                         .symmetric(
                                      //                             horizontal:
                                      //                                 20,
                                      //                             vertical:
                                      //                                 25),
                                      //                     decoration:
                                      //                         BoxDecoration(
                                      //                       color: Colors
                                      //                           .grey[100],
                                      //                       borderRadius:
                                      //                           BorderRadius
                                      //                               .circular(
                                      //                                   12.0),
                                      //                     ),
                                      //                     child: Column(
                                      //                       mainAxisSize:
                                      //                           MainAxisSize
                                      //                               .min,
                                      //                       children: [
                                      //                         CircleAvatar(
                                      //                           radius: 50,
                                      //                           backgroundColor:
                                      //                               Colors
                                      //                                   .grey,
                                      //                           backgroundImage:
                                      //                               NetworkImage(
                                      //                                   "https://cdn-icons-png.flaticon.com/512/190/190411.png"),
                                      //                         ),
                                      //                         SizedBox(
                                      //                           height: 15,
                                      //                         ),
                                      //                         Text(
                                      //                           "Great!",
                                      //                           style: (TextStyle(
                                      //                               letterSpacing:
                                      //                                   1)),
                                      //                         ),
                                      //                         SizedBox(
                                      //                           height: 15,
                                      //                         ),
                                      //                         Text(
                                      //                           "Tour Password Has Been \nSuccessfully Updated.",
                                      //                           style: Theme.of(
                                      //                                   context)
                                      //                               .textTheme
                                      //                               .button!
                                      //                               .copyWith(
                                      //                                   fontWeight:
                                      //                                       FontWeight.w500,
                                      //                                   letterSpacing: 1),
                                      //                           textAlign:
                                      //                               TextAlign
                                      //                                   .center,
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //                   Align(
                                      //                     alignment:
                                      //                         Alignment(
                                      //                             1, -1.1),
                                      //                     child: InkWell(
                                      //                       onTap: () {
                                      //                         Navigator.pop(
                                      //                             context);
                                      //                       },
                                      //                       child:
                                      //                           Container(
                                      //                         decoration:
                                      //                             BoxDecoration(
                                      //                           color: Colors
                                      //                                   .grey[
                                      //                               200],
                                      //                           borderRadius:
                                      //                               BorderRadius.circular(
                                      //                                   12),
                                      //                         ),
                                      //                         child: Icon(
                                      //                           Icons.close,
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           );
                                      //         });
                                      //   },
                                      //   child: Container(
                                      //     height: 40,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(10),
                                      //       color: Colors.blue,
                                      //     ),
                                      //     child: Center(
                                      //         child: Text(
                                      //       "Confirm",
                                      //       style: Theme.of(context)
                                      //           .textTheme
                                      //           .button!
                                      //           .copyWith(
                                      //               color: Colors.white),
                                      //     )),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                contentPadding: EdgeInsets.only(left: 10),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                leading: Icon(
                  Icons.lock_outlined,
                ),
                title: Text(
                  "Change Password",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
                height: 0,
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                contentPadding: EdgeInsets.only(left: 10),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                leading: Icon(
                  Icons.security,
                ),
                title: Text(
                  "Privacy-Police",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
                height: 0,
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                contentPadding: EdgeInsets.only(left: 10),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                leading: Icon(
                  Icons.file_copy_outlined,
                ),
                title: Text(
                  "Team-Condition",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
                height: 0,
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                contentPadding: EdgeInsets.only(left: 10),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                leading: Icon(
                  Icons.power_settings_new,
                ),
                title: Text(
                  "Sign Out",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const Color scafolBackgroudColor = Color(0xF3FFFFFF);
const Color darkTextColor = Colors.black;
const Color lightColor = Colors.white;
const Color primaryColor = Color(0xff1e3a8a);
const Color transparentColor = Colors.transparent;
const Color teamBackgroundColor = Color(0xfffee2e2);
const Color teamBackgroundColorDark = Color(0xfffca5a5);
// Map<int, Color> primaryColors = {
//   50: Color.fromRGBO(30, 58, 138, .1),
//   100: Color.fromRGBO(54, 16, 239, .2),
//   200: Color.fromRGBO(54, 16, 239, .3),
//   300: Color.fromRGBO(54, 16, 239, .4),
//   400: Color.fromRGBO(54, 16, 239, .5),
//   500: Color.fromRGBO(54, 16, 239, .6),
//   600: Color.fromRGBO(54, 16, 239, .7),
//   700: Color.fromRGBO(54, 16, 239, .8),
//   800: Color.fromRGBO(54, 16, 239, .9),
//   900: Color.fromRGBO(54, 16, 239, 1),
// };
Map<int, Color> primaryColors = {
  50: primaryColor.withOpacity(.1),
  100: primaryColor.withOpacity(.2),
  200: primaryColor.withOpacity(.3),
  300: primaryColor.withOpacity(.4),
  400: primaryColor.withOpacity(.5),
  500: primaryColor.withOpacity(.6),
  600: primaryColor.withOpacity(.7),
  700: primaryColor.withOpacity(.8),
  800: primaryColor.withOpacity(.9),
  900: primaryColor
};

class Edit_screen extends StatefulWidget {
  String name;
  String image;
  Edit_screen({required this.name, required this.image});
  @override
  _Edit_screenState createState() => _Edit_screenState();
}

class _Edit_screenState extends State<Edit_screen> {
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    emailController.text = widget.name;
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
        body: Form(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[300]),
                    child: Image.network(widget.image),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                EditField(
                  leading: Icons.person_outline_outlined,
                  hint: "Manoj Kargar",
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
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Submit")))
              ],
            ),
          ),
        ));
  }
}

class Change_password extends StatefulWidget {
  @override
  _Change_passwordState createState() => _Change_passwordState();
}

class _Change_passwordState extends State<Change_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Change Password",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditField(
                leading: Icons.lock_outlined,
                hint: "Current Password",
              ),
              SizedBox(
                height: 20,
              ),
              EditField(
                leading: Icons.lock_outlined,
                hint: "New Password",
              ),
              SizedBox(
                height: 20,
              ),
              EditField(
                leading: Icons.lock_outlined,
                hint: "Confirm Password",
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Submit")))
            ],
          ),
        ));
  }
}

class EditField extends StatelessWidget {
  final IconData? leading;
  final String? hint;
  final TextEditingController? controller;
  const EditField({this.leading, this.controller, this.hint, Key? key})
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
        prefixIconConstraints: BoxConstraints(minHeight: 60, minWidth: 60),
        prefixIcon: Icon(
          leading,
        ),
        hintText: hint,
        hintStyle: theme.textTheme.subtitle1,
        focusColor: primaryColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: primaryColor, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
