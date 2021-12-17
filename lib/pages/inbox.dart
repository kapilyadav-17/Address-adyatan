import 'package:aadhar_address_update/widgets/requestDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<NotificationCard> operatorList = <NotificationCard>[
    const NotificationCard(
        title: "Request Initiated",
        description:
            " Address request is generated and a notification is sent to Lender",
        time: "Today",
        status: 0),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double safePadding = MediaQuery.of(context).padding.top;
    return SafeArea(
        child: Scaffold(
            body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notifications",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: operatorList.length,
              itemBuilder: (context, position) {
                return InkWell(
                  onTap: () {
                    showDialog(
                      barrierColor: Colors.black26,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height * 0.4,
                          child: RequestDialog(
                            uid: "Address update request",
                            description:
                                "xxxx xxxx 1366 wants to borrow your  aadhar address .",
                            exit: false,
                          ),
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: height * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        decoration: BoxDecoration(
                            color: operatorList[position].status == 0
                                ? Colors.yellow.withOpacity(0.3)
                                : operatorList[position].status == 1
                                    ? Colors.green.withOpacity(0.3)
                                    : Colors.red.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      operatorList[position].title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Today',
                                    )
                                  ]),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(operatorList[position].description),
                              SizedBox(
                                height: 10,
                              )
                            ])),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    )));
  }
}

class NotificationCard {
  const NotificationCard(
      {required this.title,
      required this.description,
      required this.time,
      required this.status});
  final String title;
  final String description;
  final String time;
  final int status;
}
