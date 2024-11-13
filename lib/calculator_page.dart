import 'package:bear/abv_calculator.dart';
import 'package:bear/calorie_calculator.dart';
import 'package:bear/ibu_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 36.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Calculator",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 70.h,
              ),
              SizedBox(
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
                                const AbvCalculator(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF0B5A21),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        height: 50.h,
                        width: 262.w,
                        child: Center(
                          child: Text(
                            "Calculation of ABV".toUpperCase(),
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const IbuCalculator(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF0B5A21),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        height: 50.h,
                        width: 262.w,
                        child: Center(
                          child: Text(
                            "Calculation of IBU".toUpperCase(),
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const CalorieCalculator(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF0B5A21),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        height: 50.h,
                        width: 262.w,
                        child: Center(
                          child: Text(
                            "Calorie calculation".toUpperCase(),
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
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
