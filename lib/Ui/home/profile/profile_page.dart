import 'package:flutter/material.dart';
import 'package:plan_execute/routes/routes.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(PageRoutes.editProfile);
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => Edit_screen(
              //           name: "Manoj.kargar005",
              //           image:
              //               "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
              //         )));
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
                            border: Border.all(color: Colors.white, width: 2),
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
                        "Domnic.lakra",
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
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.chatNotification);
            },
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
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.chatScreen);
            },
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
                              // height: size.height * 0.31,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                                  height: 250,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
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
                                                                  vertical: 25),
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
                                                                    Colors.grey,
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
                                                                            FontWeight
                                                                                .w500,
                                                                        letterSpacing:
                                                                            1),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment(
                                                            1.09, -1.15),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[200],
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
                                        borderRadius: BorderRadius.circular(10),
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
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.privacyPolicy);
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            leading: Icon(
              Icons.security,
            ),
            title: Text(
              "Privacy-Policy",
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
            onTap: () {
              Navigator.popAndPushNamed(context, PageRoutes.signInRoute);
            },
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
    );
  }
}
