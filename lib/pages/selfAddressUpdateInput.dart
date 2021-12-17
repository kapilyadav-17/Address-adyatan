import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:flutter/material.dart';

class SelfAddressUpdateInput extends StatefulWidget {
  const SelfAddressUpdateInput({Key? key}) : super(key: key);

  @override
  _SelfAddressUpdateInputState createState() => _SelfAddressUpdateInputState();
}

class _SelfAddressUpdateInputState extends State<SelfAddressUpdateInput> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Text("Edit the address"),
          const TextField(
            decoration: InputDecoration(hintText: "xxxx xxxx xxxx"),
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
