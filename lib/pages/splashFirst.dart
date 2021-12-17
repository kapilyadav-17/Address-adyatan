import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashFirst extends StatefulWidget {
  const SplashFirst({Key? key}) : super(key: key);

  @override
  _SplashFirstState createState() => _SplashFirstState();
}

class _SplashFirstState extends State<SplashFirst> {
  CarouselController buttonCarouselController = CarouselController();
  final List<String> imgList = [
    'assets/images/my_location.svg',
    /* 'assets/images/operator.svg',
    'assets/images/help.svg',*/
    'assets/images/free.svg'
  ];
  final List<String> textList = [
    "",
    //"Instantly change address with the help of other person who is currently holding the interested address by authenticating with second person.*/",
    /* "Change your address address with the help of a verified operator authorised by Govt. of India at your doorstep with the help of supporting documents.",
    "Help others in changing their address by submitting a request to operator on behalf of them.",
   */
    "Your mobile number is required to be registered with the aadhaar to login."
  ];
  int _position = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.4,
              child: CarouselSlider(
                items: imgList
                    .map(
                      (item) => Container(
                          width: double.infinity,
                          child: SvgPicture.asset(item)),
                    )
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _position = index;
                      });
                    }
                    /*enlargeCenterPage: true,*/
                    /*viewportFraction: 0.9,
                  aspectRatio: 2.0,*/
                    /* initialPage: 2,*/
                    ),
              ),
            ),

            const Text(
              "Welcome to Aadhaar Address Update app",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              textList[_position],
              textAlign: TextAlign.center,
            ),

            // Route here
            InkWell(
              onTap: () {
                switch (_position) {
                  case 0:
                    buttonCarouselController.animateToPage(1);
                    break;
                  /* case 1:
                    buttonCarouselController.animateToPage(2);
                    break;
                  case 2:
                    buttonCarouselController.animateToPage(3);
                    break;*/
                  case 1:
                    Navigator.pushNamed(
                      context,
                      router.Router.index,
                    );
                }
                /* Navigator.pushNamed(
                  context,
                  router.Router.index,
                );*/
              },
              child: Container(
                height: height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF4FBB38)),
                child: Center(
                  child: Text(
                    _position != 1 ? "Next" : "Next",
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
      )),
    );
  }
}
