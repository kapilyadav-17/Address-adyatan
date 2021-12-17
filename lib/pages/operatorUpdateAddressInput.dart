import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:aadhar_address_update/widgets/customDialogBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OperatorAddressUpdateInput extends StatefulWidget {
  const OperatorAddressUpdateInput({Key? key}) : super(key: key);

  @override
  State<OperatorAddressUpdateInput> createState() =>
      _OperatorAddressUpdateInputState();
}

class _OperatorAddressUpdateInputState extends State<OperatorAddressUpdateInput>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  bool isDialogOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    !isDialogOpened
        ? Future.delayed(
            Duration.zero,
            () => showDialog(
                  barrierColor: Colors.black26,
                  context: context,
                  builder: (context) {
                    isDialogOpened = true;
                    return const CustomAlertDialog(
                        title: "Alert",
                        description:
                            "Your location & mobile no. will be taken for a reference, the user will be contacted on the same mobile no. verified. "
                            "Note : Mobile no. may/may not be linked with aadhaar, as this no. will only be used to contact you only on the arrival of operator executive.",
                        exit: true);
                  },
                ))
        : Container();
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
                  height: height * 0.3,
                  child: SvgPicture.asset('assets/images/login.svg')),
              const Text(
                "Enter following details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                "All these details will be used to contact you for your address update request by operator executive.",
                textAlign: TextAlign.center,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 60,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide()),
                            hintText: "Full Name"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
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
                            hintText: "Aadhaar card number"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Please enter some text';
                          // }
                          // return null;
                          if (isValidMobile(value!))
                            return null;
                          else
                            return 'Enter a valid 10 digit Mobile Number';
                        },
                        maxLength: 10,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide()),
                            hintText: "Mobile Number"),
                      ),
                    ],
                  )),

              // Route here
              InkWell(
                onTap: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    Navigator.pushNamed(context, router.Router.otp,
                        arguments: router.Router.home);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid details')),
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
  bool isValidMobile(String mobile) => mobile.length == 10;

  bool isValidAadhaarNumber(String number) => number.length == 12;
}
