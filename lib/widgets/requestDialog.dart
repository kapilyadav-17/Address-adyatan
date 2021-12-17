//custom_alert_dialog.dart
import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequestDialog extends StatefulWidget {
  const RequestDialog({
    Key? key,
    required this.uid,
    required this.description,
    required this.exit,
  }) : super(key: key);

  final String uid, description;
  final bool exit;

  @override
  _RequestDialogState createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            widget.uid,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Text(
              "${widget.description}",
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "We strongly advise to confirm the address borrower . .",
            style: TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Container(
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        widget.exit == false
                            ? Navigator.pushNamed(context, router.Router.home)
                            : Navigator.of(context).pop();
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.7 / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFF4FBB38)),
                        child: const Center(
                          child: Text(
                            "Approve",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        widget.exit == false
                            ? Navigator.pushNamed(context, router.Router.home)
                            : Navigator.of(context).pop();
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.7 / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.red),
                        child: const Center(
                          child: Text(
                            "Reject",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )
          /*Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: () {
                Navigator.pushNamed(context, router.Router.home);
                //do somethig
              },
              child: Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
