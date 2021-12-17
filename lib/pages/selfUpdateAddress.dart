import 'package:aadhar_address_update/widgets/customDialogBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelfAddressUpdate extends StatefulWidget {
  const SelfAddressUpdate({Key? key}) : super(key: key);

  @override
  State<SelfAddressUpdate> createState() => _SelfAddressUpdateState();
}

class _SelfAddressUpdateState extends State<SelfAddressUpdate>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Get height of SafeArea
    double safePadding = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: height - safePadding,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: height * 0.4,
                  child: SvgPicture.asset('assets/images/login.svg')),
              const Text(
                "Enter Aadhaar no. of Address Lender",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                "A Notification will be sent to address Lender",
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    // if (value == null || value.isEmpty) {
                    //   return 'Please enter some text';
                    // }
                    // return null;
                    if (isValidAadhaarNumber(value!))
                      return null;
                    else
                      return 'Enter a valid Aadhaar Card Number';
                  },
                  maxLength: 12,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide()),
                      hintText: "xxxx xxxx xxxx"),
                ),
              ),

              // Route here
              GestureDetector(
                onTap: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    showDialog(
                      barrierColor: Colors.black26,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height * 0.4,
                          child: CustomAlertDialog(
                            title: "Request sent",
                            description:
                                "A request is sent to inbox of AADHAR APP acccount of lender.You  can Generate Only 3 Requests in a month",
                            exit: false,
                          ),
                        );
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid Aadhaar No.')),
                    );
                  }
                },
                child: Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFF4FBB38)),
                  child: const Center(
                    child: Text(
                      "Submit Request",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isValidAadhaarNumber(String email) {
    RegExp regExp = RegExp(
      r"^[01]\d{3}[\s-]?\d{4}[\s-]?\d{4}$",
      caseSensitive: false,
      multiLine: false,
    );
    print(regExp.hasMatch(email.toString()));
    return regExp.hasMatch(email);
    // Pattern pattern = '';
    // RegExp regex = new RegExp(pattern.toString());
    // return regex.hasMatch(email);
  }
}
