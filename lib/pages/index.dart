import 'dart:convert';

import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:xml/xml.dart' as xml;

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController aadharControlller = new TextEditingController();

  var dio = Dio();
  Future<dynamic> postReq(String uid) async {
    var now = DateTime.now();
    var uuid = Uuid();

    /*final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('bookshelf', nest: () {
      builder.element('book', nest: () {
        builder.element('title', nest: () {
          builder.attribute('lang', 'en');
          builder.text('Growing a Language');
        });
        builder.element('price', nest: 29.99);
      });
      builder.element('book', nest: () {
        builder.element('title', nest: () {
          builder.attribute('lang', 'en');
          builder.text('Learning XML');
        });
        builder.element('price', nest: 39.95);
      });
      builder.element('price', nest: 132.00);
    });
    final bookshelfXml = builder.buildDocument();*/

    var builder = xml.XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element("ns2:Otp", nest: () {
      builder.attribute(
          "xmlns:ns2", "http://www.uidai.gov.in/authentication/otp/1.0");
      builder.attribute("ac", "public");
      builder.attribute(
          "lk", "MAElpSz56NccNf11_wSM_RrXwa7n8_CaoWRrjYYWouA1r8IoJjuaGYg");
      builder.attribute("sa", "public");
      builder.attribute("ts", now.toIso8601String());
      builder.attribute("txn", uuid.v4());
      builder.attribute("type", "a");
      builder.attribute("uid", uid);
      builder.attribute("ver", "2.5");
      builder.element("Opts", nest: () {
        builder.attribute("ch", "01");
      });
      builder.element("Signature", nest: () {
        builder.attribute("xmlns", "http://www.w3.org/2000/09/xmldsig#");

        builder.element("SignedInfo", nest: () {
          builder.element("CanonicalizationMethod", nest: () {
            builder.attribute(
                "Algorithm", "http://www.w3.org/TR/2001/REC-xml-c14n-20010315");
          });
          builder.element("SignatureMethod", nest: () {
            builder.attribute(
                "Algorithm", "http://www.w3.org/2000/09/xmldsig#rsa-sha1");
          });
          builder.element("Reference", nest: () {
            builder.attribute("URI", "");
            builder.element("Transforms", nest: () {
              builder.element("Transform", nest: () {
                builder.attribute("Algorithm",
                    "http://www.w3.org/2000/09/xmldsig#enveloped-signature");
              });
            });
            builder.element("DigestMethod", nest: () {
              builder.attribute(
                  "Algorithm", "http://www.w3.org/2000/09/xmldsig#sha1");
            });
            builder.element("DigestValue", nest: () {
              builder.text("09RytQr7oQsQgRRWMFfoBNnqrQ0=");
            });
          });
        });
        builder.element("SignatureValue", nest: () {
          builder.text(
              "UbSMkpy5LQ2lWGYyzmIIC5pUUuq3WpOll5rZd0LMgBdA7BVU5Mz9yIEgoZRCi814Bo15Jpsm2yGC&#13;"
              "AtpepqIvEuWLK/Uf6LFfsBm0YxW9ay+3BemtNsk4grZPCZO6AkgCVwyDajgOF5ygntEuv7k5+obJ&#13;"
              "0xawXzGfwV27ibPoWueUXXrvOOmO3yg2pC4RoIk4ABNe7L0tI8HqWubVWG95oPPyB2l7vkZMS5Pa&#13;"
              "Pe2baf83wxGYzXtYUhXiva7Hp0k3/MHrk+B9Xo8psWnjRJ/NKAuob0OJ7DfYkiprkFvj/0f8IJsv&#13;BDQVau/qvrEcko/x4aF5IH1gYG+oLC/fPEY19g==");
        });
        builder.element("KeyInfo", nest: () {
          builder.element("X509Data", nest: () {
            builder.element("X509SubjectName", nest: () {
              builder.text(
                  "CN=Public AUA for Staging Services,OU=Staging Services,O=Public AUA,L=Bangalore,ST=KA,C=IN");
            });
            builder.element("X509Certificate", nest: () {
              builder.text(
                  'MIIDuTCCAqGgAwIBAgIHBbjQqpe5NjANBgkqhkiG9w0BAQUFADCBjTELMAkGA1UEBhMCSU4xCzAJ'
                  'BgNVBAgTAktBMRIwEAYDVQQHEwlCYW5nYWxvcmUxEzARBgNVBAoTClB1YmxpYyBBVUExGTAXBgNV'
                  'BAsTEFN0YWdpbmcgU2VydmljZXMxLTArBgNVBAMTJFJvb3QgUHVibGljIEFVQSBmb3IgU3RhZ2lu'
                  'ZyBTZXJ2aWNlczAeFw0yMDA1MjUwOTMyMjRaFw0yNDA1MjUwOTMyMjRaMIGIMQswCQYDVQQGEwJJ'
                  'TjELMAkGA1UECBMCS0ExEjAQBgNVBAcTCUJhbmdhbG9yZTETMBEGA1UEChMKUHVibGljIEFVQTEZ'
                  'MBcGA1UECxMQU3RhZ2luZyBTZXJ2aWNlczEoMCYGA1UEAxMfUHVibGljIEFVQSBmb3IgU3RhZ2lu'
                  'ZyBTZXJ2aWNlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAI+b6Gcwg0+MJP+YUePf'
                  'lCCEBWj3PdICPenFMqETxTACphlhPKjO2XAnWU3frp+a76NBqEbZ5ZOrUeE70Dj9BHZo7gFm72BN'
                  'uU5AFYwvCGzCVButExgVAe9bWO07bG1TKwdPEPUzO2O8QV7YaaHFU+SfZTPRam3ycn6nfIceue9n'
                  '1IH6sAdCgcfiKpgBYbenrG+u9bNVrvasYCXPUBqS1CzsVGv75ekdCu7vxbr3w941KO31kdCQpVVa'
                  's+khAC3vMKWkhR77PHoGQvx5yvsGW9QPVw+JLHabGlRNe3C4xMZ1rdCUslQ7VshQlkDQIxiu9jOk'
                  '+B1wexT78wtVGvunolkCAwEAAaMhMB8wHQYDVR0OBBYEFB6nQeWTHs78YZvfDfnSWIuXuU2cMA0G'
                  'CSqGSIb3DQEBBQUAA4IBAQAp+MnpqVO1SJ+ilCS++L7WV4AQlVTwCzHW4QyIV+6Mb50PIYhmoFXj'
                  'KF7t71jvQ3WP2jocp7Ouy07+sT7Knuhy4/RpCwCSyZpKCQjfRqKPEW8CYc17TEYUxufvwBfzzOGZ'
                  'CTIwtgGrOC23XoVXNd+bwn1Lbsrb0dd98Rp3AGccwcVPp8TgwzNY2oH78HRF/ScUONebyCT+eOIC'
                  'Vxjc73qnYvGe5t25bl/kgm6NsAYimr/at7suqiMZQWp5SEfbRYCZ9wvQsJgX01g92zk3ELV9g5fb'
                  'O9VrKr9vN0QA7VjkrfzuCtR/MGIsYBpZzcX1vDlUscXO1u4fVROETTOSS3jc');
            });
          });
        });
      });
    });
    final bookshelfXml = builder.buildDocument();

    //var response =

    //var dataToSent =
    //   '''<?xml version="1.0" encoding="UTF-8"?><ns2:Otp xmlns:ns2="http://www.uidai.gov.in/authentication/otp/1.0" ac="public" lk="MAElpSz56NccNf11_wSM_RrXwa7n8_CaoWRrjYYWouA1r8IoJjuaGYg" sa="public" ts="${now.toIso8601String()}" txn="${uuid.v4()}" type="A" uid="${uid}" ver="2.5"><Opts ch="01"/><Signature xmlns="http://www.w3.org/2000/09/xmldsig#"><SignedInfo><CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/><SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/><Reference URI=""><Transforms><Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/></Transforms><DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><DigestValue>09RytQr7oQsQgRRWMFfoBNnqrQ0=</DigestValue></Reference></SignedInfo><SignatureValue>Do+W2IomxYt4Eesh+nLE6h2PfMaRAhdhE/eCXYNNluzoH9/BHs9JjlVfXeZ48XssjrnezI58F62OV5SpsyaMz/CWp2jtyruTpSkiFUgzHLi68OFoADPkp3RYEb6VZrrjlkF2BB/qpOlwSgNbwlq2jjsgn/7BOQaM+zGgke0+xna/SeWZMwKkT2TDQZQFJMYCUf1+KtDMQleMNgQgNXw+a/cBBFD53rYz4cQg8Sr6rsKNSnunMKNeF7TKLZ4yNOkiruneWAxyAmrdForBCLmsBXFL/dMFdFx6Ol9JmQ9MPeJfb+X+3vzE5Vxl2FX5iQCmmsLQfUSCxdRr/G5076eecg==</SignatureValue><KeyInfo><X509Data><X509SubjectName>CN=Public AUA for Staging Services,OU=Staging Services,O=Public AUA,L=Bangalore,ST=KA,C=IN</X509SubjectName><X509Certificate>MIIDuTCCAqGgAwIBAgIHBbjQqpe5NjANBgkqhkiG9w0BAQUFADCBjTELMAkGA1UEBhMCSU4xCzAJBgNVBAgTAktBMRIwEAYDVQQHEwlCYW5nYWxvcmUxEzARBgNVBAoTClB1YmxpYyBBVUExGTAXBgNVBAsTEFN0YWdpbmcgU2VydmljZXMxLTArBgNVBAMTJFJvb3QgUHVibGljIEFVQSBmb3IgU3RhZ2luZyBTZXJ2aWNlczAeFw0yMDA1MjUwOTMyMjRaFw0yNDA1MjUwOTMyMjRaMIGIMQswCQYDVQQGEwJJTjELMAkGA1UECBMCS0ExEjAQBgNVBAcTCUJhbmdhbG9yZTETMBEGA1UEChMKUHVibGljIEFVQTEZMBcGA1UECxMQU3RhZ2luZyBTZXJ2aWNlczEoMCYGA1UEAxMfUHVibGljIEFVQSBmb3IgU3RhZ2luZyBTZXJ2aWNlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAI+b6Gcwg0+MJP+YUePflCCEBWj3PdICPenFMqETxTACphlhPKjO2XAnWU3frp+a76NBqEbZ5ZOrUeE70Dj9BHZo7gFm72BNuU5AFYwvCGzCVButExgVAe9bWO07bG1TKwdPEPUzO2O8QV7YaaHFU+SfZTPRam3ycn6nfIceue9n1IH6sAdCgcfiKpgBYbenrG+u9bNVrvasYCXPUBqS1CzsVGv75ekdCu7vxbr3w941KO31kdCQpVVas+khAC3vMKWkhR77PHoGQvx5yvsGW9QPVw+JLHabGlRNe3C4xMZ1rdCUslQ7VshQlkDQIxiu9jOk+B1wexT78wtVGvunolkCAwEAAaMhMB8wHQYDVR0OBBYEFB6nQeWTHs78YZvfDfnSWIuXuU2cMA0GCSqGSIb3DQEBBQUAA4IBAQAp+MnpqVO1SJ+ilCS++L7WV4AQlVTwCzHW4QyIV+6Mb50PIYhmoFXjKF7t71jvQ3WP2jocp7Ouy07+sT7Knuhy4/RpCwCSyZpKCQjfRqKPEW8CYc17TEYUxufvwBfzzOGZCTIwtgGrOC23XoVXNd+bwn1Lbsrb0dd98Rp3AGccwcVPp8TgwzNY2oH78HRF/ScUONebyCT+eOICVxjc73qnYvGe5t25bl/kgm6NsAYimr/at7suqiMZQWp5SEfbRYCZ9wvQsJgX01g92zk3ELV9g5fbO9VrKr9vN0QA7VjkrfzuCtR/MGIsYBpZzcX1vDlUscXO1u4fVROETTOSS3jc</X509Certificate></X509Data></KeyInfo></Signature></ns2:Otp>''';
    //var parsedXml = XmlDocument.parse(dataToSent);
    // var response = await http.post(
    //     Uri.parse(
    //         'https://otp-stage.uidai.gov.in/uidotpserver/2.5/public/9/9/MEY2cG1nhC02dzj6hnqyKN2A1u6U0LcLAYaPBaLI-3qE-FtthtweGuk'),
    //     headers: <String, String>{
    //       'Content-Type': 'application/xml; charset=UTF-8',
    //     },
    //     body: dataToSent);
    var response = await dio.request(
      'https://otp-stage.uidai.gov.in/uidotpserver/2.5/public/9/9/MEY2cG1nhC02dzj6hnqyKN2A1u6U0LcLAYaPBaLI-3qE-FtthtweGuk',
      data: bookshelfXml.toString(),
      options: Options(method: 'POST'),
    );
    return response;
  }

  Future<dynamic> getReq(String uid) async {
    var response =
        await http.get(Uri.parse("http://192.168.9.106:8080/uid/$uid"));
    /* var response = await dio.request(
      "192.168.9.106:8080/uid/$uid",
      options: Options(method: 'GET'),
    );*/
    var responseData = json.decode(response.body);
    return responseData;
  }

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
                "Welcome to Aadhaar Address Update app",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Please enter your Aadhaar Card number for authentication",
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
                    if (value!.isNotEmpty)
                      return null;
                    else
                      return 'Enter a valid Aadhaar Card Number';
                  },
                  controller: aadharControlller,
                  maxLength: 12,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide()),
                      hintText: "xxxx xxxx xxxx"),
                ),
              ),

              // Route here
              InkWell(
                onTap: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    var abc = await getReq(aadharControlller.value.text);
                    //var abc = "success";
                    print('################# $abc');
                    if (abc == "success" || abc == "") {
                      Navigator.pushNamed(context, router.Router.otp,
                          arguments: router.Router.home);
                    } else if (abc == "952" || abc == "953") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Error: $abc, Max tries already occured!')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Error: $abc, An error occured!')));
                    }
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
                      "Send OTP",
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
