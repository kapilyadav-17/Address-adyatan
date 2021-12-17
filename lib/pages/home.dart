import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Explore online Address Update services ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "Choose the way you want to Update Address ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: height * 0.05,
                  mainAxisSpacing: height * 0.05,
                ),
                itemCount: choices.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, choices[index].navigateTo);
                      },
                      child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: height * 0.06,
                                    child: Image.asset(choices[index].image)),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: Text(
                                    choices[index].title.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ])),
                    ),
                  );
                },
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, router.Router.selfUpdateAddress);
                    },
                    child: Container(
                      width: width * 0.4,
                      height: height * 0.2,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue),
                      child: const Center(
                        child: Text("Update Aadhaar Address by self"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, router.Router.operatorUpdateAddressInput);
                    },
                    child: Container(
                      width: width * 0.4,
                      height: height * 0.2,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.redAccent),
                      child: const Center(
                        child: Text("Update Aadhaar Address by Agent"),
                      ),
                    ),
                  )
                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

const List<ServiceCard> choices = <ServiceCard>[
  ServiceCard(
      title: "Self Address Update",
      description: "Address will be uodated by yourself",
      navigateTo: router.Router.selfUpdateAddress,
      backgroundColor: Colors.blue,
      image: 'assets/images/selfUpdate.png'),
  ServiceCard(
      title: "Address Update by Operator",
      description: "Address will be uodated by operator",
      navigateTo: router.Router.operatorUpdateAddressInput,
      backgroundColor: Colors.red,
      image: 'assets/images/operatorUpdate.png'),
  ServiceCard(
      title: "Requests",
      description: "Address will be uodated by yourself",
      navigateTo: router.Router.inbox,
      backgroundColor: Colors.blue,
      image: 'assets/images/inbox.png'),
  ServiceCard(
      title: "Notifications",
      description: "Address will be uodated by yourself",
      navigateTo: router.Router.inbox,
      backgroundColor: Colors.blue,
      image: 'assets/images/notification.png'),
];

class ServiceCard {
  const ServiceCard(
      {required this.title,
      required this.navigateTo,
      required this.description,
      required this.backgroundColor,
      required this.image});
  final String title;
  final String description;
  final String navigateTo;
  final Color backgroundColor;
  final String image;
}
