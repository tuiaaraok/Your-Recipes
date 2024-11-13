import 'package:bear/add_party_page.dart';
import 'package:bear/cooking_stages_page.dart';
import 'package:bear/model/boxes.dart';
import 'package:bear/model/party_model.dart';
import 'package:bear/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PartyPage extends StatefulWidget {
  const PartyPage({super.key});

  @override
  State<PartyPage> createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  int currentIndex = -1;

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
                          "Party",
                          style: TextStyle(fontSize: 24.sp),
                        ),
                      ),
                      for (int i = box.values.length-1; i >=0; i--)
                        GestureDetector(
                          onTap: () {
                            if (currentIndex == i) {
                              currentIndex = -1;
                            } else {
                              currentIndex = i;
                            }
                            setState(() {});
                          },
                          child: SizedBox(
                            width: 200.w,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: currentIndex == i
                                        ? const Color(0xFF0B5A21)
                                        : null,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                    border: Border.all(
                                        color: const Color(0xFF0B5A21), width: 2.w)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 10.w),
                                  child: Center(
                                    child: Text(
                                      box.getAt(i)!.nameParty!.toUpperCase(),
                                      style: TextStyle(
                                          color: currentIndex == i
                                              ? Colors.white
                                              : const Color(0xFF0B5A21),
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
                            if (currentIndex != -1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => RecipePage(
                                    index: currentIndex,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const AddPartyPage(),
                                ),
                              );
                            }
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
                                        currentIndex != -1
                                            ? "Add a recipe".toUpperCase()
                                            : "Add a party".toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
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
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                        child: GestureDetector(
                          onTap: () {
                            if (currentIndex != -1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      CookingStagesPage(
                                    index: currentIndex,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: const Color(0xFF0B5A21),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r))),
                            child: Center(
                              child: Text(
                                "start a party".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                        child: GestureDetector(
                          onTap: () {
                            if (currentIndex != -1) {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.6.h,
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.r))),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
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
                                                                  currentIndex)!
                                                              .nameParty
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
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(box
                                                              .getAt(
                                                                  currentIndex)!
                                                              .date
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
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(box
                                                              .getAt(
                                                                  currentIndex)!
                                                              .volume
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
                                                            .getAt(
                                                                currentIndex)!
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
                                                                    currentIndex)!
                                                                .ingradients![j]),
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
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: const Color(0xFF0B5A21),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r))),
                            child: Center(
                              child: Text(
                                "Indormation".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
