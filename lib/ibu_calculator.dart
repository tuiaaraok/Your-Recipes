import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class IbuCalculator extends StatefulWidget {
  const IbuCalculator({super.key});

  @override
  State<IbuCalculator> createState() {
    // TODO: implement createState
    return _IbuCalculatorState();
  }
}

class _IbuCalculatorState extends State<IbuCalculator> {
  TextEditingController theAmountController = TextEditingController();
  TextEditingController alphaAcidController = TextEditingController();
  TextEditingController boilingTimeController = TextEditingController();
  TextEditingController wortVolumeController = TextEditingController();
  // TextEditingController postController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  double? resert;
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
                if (theAmountController.text.isNotEmpty &&
                    alphaAcidController.text.isNotEmpty &&
                    boilingTimeController.text.isNotEmpty &&
                    wortVolumeController.text.isNotEmpty) {
                  resert = (double.parse(theAmountController.text) *
                          double.parse(alphaAcidController.text) *
                          double.parse(boilingTimeController.text) *
                          1000) /
                      double.parse(wortVolumeController.text);
                  setState(() {});
                }
              },
            ),
            KeyboardActionsItem(
              focusNode: _nodeText2,
              onTapAction: () {
                if (theAmountController.text.isNotEmpty &&
                    alphaAcidController.text.isNotEmpty &&
                    boilingTimeController.text.isNotEmpty &&
                    wortVolumeController.text.isNotEmpty) {
                  resert = (double.parse(theAmountController.text) *
                          double.parse(alphaAcidController.text) *
                          double.parse(boilingTimeController.text) *
                          1000) /
                      double.parse(wortVolumeController.text);
                  setState(() {});
                }
              },
            ),
            KeyboardActionsItem(
              focusNode: _nodeText3,
              onTapAction: () {
                if (theAmountController.text.isNotEmpty &&
                    alphaAcidController.text.isNotEmpty &&
                    boilingTimeController.text.isNotEmpty &&
                    wortVolumeController.text.isNotEmpty) {
                  resert = (double.parse(theAmountController.text) *
                          double.parse(alphaAcidController.text) *
                          double.parse(boilingTimeController.text) *
                          1000) /
                      double.parse(wortVolumeController.text);
                  setState(() {});
                }
              },
            ),
            KeyboardActionsItem(
              focusNode: _nodeText4,
              onTapAction: () {
                if (theAmountController.text.isNotEmpty &&
                    alphaAcidController.text.isNotEmpty &&
                    boilingTimeController.text.isNotEmpty &&
                    wortVolumeController.text.isNotEmpty) {
                  resert = (double.parse(theAmountController.text) *
                          double.parse(alphaAcidController.text) *
                          double.parse(boilingTimeController.text) *
                          1000) /
                      double.parse(wortVolumeController.text);
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
                    "Calculator of IBU",
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
                                    "The amount of hops (g)",
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
                                        controller: theAmountController,
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
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Alpha acid levels (a)",
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: TextField(
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        textAlign: TextAlign.center,
                                        controller: alphaAcidController,
                                        focusNode: _nodeText2,
                                        textInputAction:
                                            TextInputAction.newline,
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
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Boiling time (min)",
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: TextField(
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        textAlign: TextAlign.center,
                                        controller: boilingTimeController,
                                        focusNode: _nodeText3,
                                        textInputAction:
                                            TextInputAction.newline,
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
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Wort volume (l)",
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: TextField(
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        textAlign: TextAlign.center,
                                        controller: wortVolumeController,
                                        focusNode: _nodeText4,
                                        textInputAction:
                                            TextInputAction.newline,
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
                              children: [
                                Text(
                                  "IBU = ",
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
