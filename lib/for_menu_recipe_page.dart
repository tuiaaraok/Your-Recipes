import 'package:bear/model/boxes.dart';
import 'package:bear/model/recipet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ForMenuRecipePage extends StatefulWidget {
  const ForMenuRecipePage({
    super.key,
  });

  @override
  State<ForMenuRecipePage> createState() => _ForMenuRecipePageState();
}

class _ForMenuRecipePageState extends State<ForMenuRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable:
              Hive.box<RecipetModel>(HiveBoxes.recipetModel).listenable(),
          builder: (context, Box<RecipetModel> box, _) {
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
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
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                        child: Text(
                          "Bear Recipes",
                          style: TextStyle(fontSize: 24.sp),
                        ),
                      ),
                      for (int i = 0; i < box.values.length; i++)
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.6.h,
                                  widthFactor: 1,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 86.w,
                                            height: 6.h,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFD9D9D9),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.r))),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 352.w,
                                        height: 480.h,
                                        child: ListView(
                                          children: [
                                            SizedBox(
                                              width: 352.w,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 53.h,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(box
                                                          .getAt(i)!
                                                          .theNameOfTheRecipe
                                                          .toString()),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.h,
                                                    color:
                                                        const Color(0xFFD9D9D9),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 352.w,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 53.h,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(box
                                                          .getAt(i)!
                                                          .typeOfCooking
                                                          .toString()),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.h,
                                                    color:
                                                        const Color(0xFFD9D9D9),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 352.w,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 53.h,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(box
                                                          .getAt(i)!
                                                          .cookingStages
                                                          .toString()),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.h,
                                                    color:
                                                        const Color(0xFFD9D9D9),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 352.w,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 53.h,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(box
                                                          .getAt(i)!
                                                          .expectedCharacteristics
                                                          .toString()),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.h,
                                                    color:
                                                        const Color(0xFFD9D9D9),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 352.w,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 53.h,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(box
                                                          .getAt(i)!
                                                          .dateOfCreationOfTheRecipe
                                                          .toString()),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 2.h,
                                                    color:
                                                        const Color(0xFFD9D9D9),
                                                  )
                                                ],
                                              ),
                                            ),
                                            for (int j = 0;
                                                j <
                                                    box
                                                        .getAt(i)!
                                                        .ingradients!
                                                        .length;
                                                j++)
                                              SizedBox(
                                                width: 352.w,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 53.h,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(box
                                                            .getAt(i)!
                                                            .ingradients![j]
                                                            .toString()),
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: 2.h,
                                                      color: const Color(
                                                          0xFFD9D9D9),
                                                    )
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: SizedBox(
                            width: 200.w,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFF0B5A21),
                                        width: 2.w)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 10.w),
                                  child: Center(
                                    child: Text(
                                      box
                                          .getAt(i)!
                                          .theNameOfTheRecipe
                                          .toString(),
                                      style: TextStyle(
                                          color: const Color(0xFF0B5A21),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21.87.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
