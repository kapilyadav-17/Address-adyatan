import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key, required this.navigateTo}) : super(key: key);
  final String navigateTo;

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> with InputValidationMixin {
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
                  child: SvgPicture.asset('assets/images/otp.svg')),
              const Text(
                "Enter the OTP",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                "An otp has been sent to your mobile no.",
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
                    if (isOTPValid(value!))
                      return null;
                    else
                      return 'OTP length is 6 characters';
                  },
                  maxLength: 6,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide()),
                      hintText: "xxxxxx"),
                ),
              ),

              // Route here
              InkWell(
                onTap: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    Navigator.pushNamed(context, widget.navigateTo);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Wrong OTP.')),
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
                      "Login",
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
  bool isOTPValid(String otp) => otp.length == 6;

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
