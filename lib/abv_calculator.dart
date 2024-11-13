import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class AbvCalculator extends StatefulWidget {
  const AbvCalculator({super.key});

  @override
  State<AbvCalculator> createState() {
    // TODO: implement createState
    return _AbvCalculatorState();
  }
}

class _AbvCalculatorState extends State<AbvCalculator> {
  TextEditingController initialDensity = TextEditingController();
  TextEditingController thefinal = TextEditingController();
  // TextEditingController postController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  double? resert;
  // FocusNode _nodeText3 = FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: KeyboardActions(
          config: KeyboardActionsConfig(nextFocus: false, actions: [
            KeyboardActionsItem(
              focusNode: _nodeText1,
              onTapAction: () {
                if (thefinal.text.isNotEmpty &&
                    initialDensity.text.isNotEmpty) {
                  resert = (double.parse(initialDensity.text) -
                          double.parse(thefinal.text)) *
                      131.25;
                  setState(() {});
                }
              },
            ),
            KeyboardActionsItem(
              focusNode: _nodeText2,
              onTapAction: () {
                if (thefinal.text.isNotEmpty &&
                    initialDensity.text.isNotEmpty) {
                  resert = (double.parse(initialDensity.text) -
                          double.parse(thefinal.text)) *
                      131.25;
                  setState(() {});
                }
              },
            ),
          ]),
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
                  Text(
                    "Calculator of ABV",
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: Container(
                      width: 357.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B5A21),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 20.w),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Initial density (OG)",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  ),
                                  Container(
                                    width: 81.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.r)),
                                        color: Colors.white.withOpacity(0.8)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: TextField(
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        textAlign: TextAlign.center,
                                        controller: initialDensity,
                                        focusNode: _nodeText1,
                                        decoration: InputDecoration(
                                            border: InputBorder
                                                .none, // Убираем обводку
                                            focusedBorder: InputBorder
                                                .none, // Убираем обводку при фокусе
                                            hintText: '',
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontSize: 14.sp)),
                                        cursorColor: Colors.black,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp),
                                        onChanged: (text) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "The final density (FG)",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                                Container(
                                  width: 81.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.r)),
                                      color: Colors.white.withOpacity(0.8)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: TextField(
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      textAlign: TextAlign.center,
                                      controller: thefinal,
                                      focusNode: _nodeText2,
                                      textInputAction: TextInputAction.newline,
                                      decoration: InputDecoration(
                                          border: InputBorder
                                              .none, // Убираем обводку
                                          focusedBorder: InputBorder
                                              .none, // Убираем обводку при фокусе
                                          hintText: '',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 14.sp)),
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                      onChanged: (text) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 56.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ABV = ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Expanded(
                                  child: Text(
                                    "${resert ?? ''}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
