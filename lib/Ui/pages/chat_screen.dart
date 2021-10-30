import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/signIn_page.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var currunttime = DateTime.now();

    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              titleSpacing: 0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ABC", style: Theme.of(context).textTheme.headline1),
                      Text(
                        "Team Name",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  )
                ],
              )
              // title: ListTile(
              //     leading: CircleAvatar(
              //       radius: 25,
              //       backgroundColor: Colors.grey,
              //       backgroundImage: NetworkImage(
              //           "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
              //     ),
              //     title: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("ABC", style: Theme.of(context).textTheme.headline1),
              //         Text("Team Name"),
              //       ],
              //     )),
              ),
          body: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: Mes.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Align(
                              alignment: (index.isOdd)
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: (index.isEven)
                                  ? Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 13,
                                            backgroundImage: NetworkImage(
                                                "https://mlhmvq6amqed.i.optimole.com/HIId8M4.WANK~27a14/w:940/h:788/q:auto/https://hackspirit.com/wp-content/uploads/2021/06/Copy-of-Copy-of-Copy-of-Rustic-Female-Teen-Magazine-Cover-52.jpg"),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    13),
                                                            topLeft:
                                                                Radius.circular(
                                                                    13),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    13)),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xff028efd),
                                                          Color(0xff66bcfe)
                                                        ])),
                                                child: Text(
                                                  "${Mes[index].mesg}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Text(
                                                "${day[currunttime.weekday]}, ${month[currunttime.month - 1]} ${currunttime.day} ${currunttime.hour}:${currunttime.minute} ${(currunttime.hour < 12) ? "AM" : "PM"}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                        color:
                                                            Colors.grey[400]),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 3),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(13),
                                                    bottomLeft:
                                                        Radius.circular(13),
                                                    topLeft:
                                                        Radius.circular(13)),
                                                color: Colors.grey[300]),
                                            child: Text(
                                              "${Mes[index].mesg}",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Text(
                                            "${day[currunttime.weekday]}, ${month[currunttime.month - 1]} ${currunttime.day} ${currunttime.hour}:${currunttime.minute} ${(currunttime.hour < 12) ? "AM" : "PM"}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    color: Colors.grey[400]),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        );
                      }),
                ),
                Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      // isCollapsed: true,
                      hintText: "Send Message",
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class mes {
  String mesg;
  mes({required this.mesg});
}

List<mes> Mes = [
  mes(mesg: "Is there anything I can help you with?"),
  mes(mesg: "I need help with one of your listed service!"),
  mes(mesg: "Sure! which one you have a question for?"),
];

List month = [
  "Jan",
  "Feb",
  "March",
  "April",
  "May",
  "June",
  "July",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];
List day = [
  "Sun",
  "Mon",
  "Tues",
  "Wednes",
  "Thurs",
  "Fri",
  "Satur",
];
