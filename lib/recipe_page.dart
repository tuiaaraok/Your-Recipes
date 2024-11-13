import 'package:bear/add_recipet_page.dart';
import 'package:bear/model/boxes.dart';
import 'package:bear/model/party_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key, required this.index});
  final int index;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable:
              Hive.box<PartyModel>(HiveBoxes.partyModel).listenable(),
          builder: (context, Box<PartyModel> box, _) {
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
                          "Recipe",
                          style: TextStyle(fontSize: 24.sp),
                        ),
                      ),
                      for (int i = box.getAt(widget.index)?.recipets == null
                              ? 0
                              : box.getAt(widget.index)!.recipets!.length - 1;
                          box.getAt(widget.index)?.recipets != null && i >= 0;
                          i--)
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
                                                          .getAt(widget.index)!
                                                          .recipets![i]
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
                                                          .getAt(widget.index)!
                                                          .recipets![i]
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
                                                          .getAt(widget.index)!
                                                          .recipets![i]
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
                                                          .getAt(widget.index)!
                                                          .recipets![i]
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
                                                          .getAt(widget.index)!
                                                          .recipets![i]
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
                                                        .getAt(widget.index)!
                                                        .recipets![i]
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
                                                            .getAt(
                                                                widget.index)!
                                                            .recipets![i]
                                                            .ingradients![j]),
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
                                          .getAt(widget.index)!
                                          .recipets![i]
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      AddRecipetPage(index: widget.index)),
                            );
                          },
                          child: SizedBox(
                            width: 178.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 138.w,
                                    height: 36.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF0B5A21),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Add a recipe",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 48.r,
                                    height: 48.r,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xFF0B5A21),
                                        border: Border.all(
                                            color: Colors.white, width: 2.w)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
