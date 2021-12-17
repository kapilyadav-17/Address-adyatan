import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:flutter/material.dart';

class SelectOperator extends StatefulWidget {
  const SelectOperator({Key? key}) : super(key: key);

  @override
  _SelectOperatorState createState() => _SelectOperatorState();
}

class _SelectOperatorState extends State<SelectOperator> {
  List<String> operatorList = <String>[
    "vodafone mgarh",
    "vodafone kanina",
    "vodafone narnaul",
    "jio mgarh",
    "jio kanina",
    "vodafone mgarh",
    "vodafone kanina",
    "vodafone narnaul",
    "jio mgarh",
    "jio kanina",
    "vodafone mgarh",
    "vodafone kanina",
    "vodafone narnaul",
    "jio mgarh",
    "jio kanina"
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Text("Select any favourable operator"),
          SizedBox(
            height: height * 0.8,
            child: ListView.builder(
              itemCount: operatorList.length,
              itemBuilder: (context, position) {
                return SizedBox(
                    height: height * 0.1, child: Text(operatorList[position]));
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, router.Router.done);
            },
            child: Container(
              height: height * 0.05,
              width: width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.blue),
              child: const Center(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
