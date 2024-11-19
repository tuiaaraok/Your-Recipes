import 'dart:developer';

import 'package:bear/calculator_page.dart';
import 'package:bear/for_menu_recipe_page.dart';
import 'package:bear/party_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E421E),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        child: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 371.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/preview.png"))),
              ),
              SizedBox(
                width: 273.w,
                height: 210.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const PartyPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 273.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: const Color(0xFFEBEBEB),
                        ),
                        child: const Center(
                            child: Text(
                          "Party",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E421E)),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ForMenuRecipePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 273.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: const Color(0xFFEBEBEB),
                        ),
                        child: const Center(
                            child: Text(
                          "Beer Recipes",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E421E)),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const CalculatorPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 273.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: const Color(0xFFEBEBEB),
                        ),
                        child: const Center(
                            child: Text(
                          "Calculator",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E421E)),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 341.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        String? encodeQueryParameters(
                            Map<String, String> params) {
                          return params.entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        // ···
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'sariceren@icloud.com',
                          query: encodeQueryParameters(<String, String>{
                            '': '',
                          }),
                        );
                        try {
                          if (await canLaunchUrl(emailLaunchUri)) {
                            await launchUrl(emailLaunchUri);
                          } else {
                            throw Exception("Could not launch $emailLaunchUri");
                          }
                        } catch (e) {
                          log('Error launching email client: $e'); // Log the error
                        }
                      },
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(
                            'https://docs.google.com/document/d/1y0Y3tJQ0qlAKUpUboJRQT6te5D_5YBc0EuX6-H-EZ3M/mobilebasic');
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final InAppReview inAppReview = InAppReview.instance;
                        inAppReview.openStoreListing(
                          appStoreId: '6738093125',
                        );
                      },
                      child: Text(
                        "Rate Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
