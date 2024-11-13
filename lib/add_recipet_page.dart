import 'package:bear/model/boxes.dart';
import 'package:bear/model/party_model.dart';
import 'package:bear/model/recipet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class AddRecipetPage extends StatefulWidget {
  const AddRecipetPage({super.key, required this.index});
  final int index;
  @override
  State<AddRecipetPage> createState() {
    return _AddRecipetPageState();
  }
}

class _AddRecipetPageState extends State<AddRecipetPage> {
  TextEditingController theNameOfTheRecipeController = TextEditingController();
  TextEditingController typeOfCookingController = TextEditingController();
  TextEditingController cookingStagesController = TextEditingController();
  TextEditingController expectedCharacteristicsController =
      TextEditingController();
  TextEditingController dateOfCreationOfTheRecipeController =
      TextEditingController();
  List<TextEditingController> ingridientsController = [TextEditingController()];
  bool allFieldsFilled() {
    bool emptyText = false;
    for (var controller in ingridientsController) {
      if (controller.text.isEmpty) {
        emptyText = true;
      }
    }
    if (emptyText) {
      return false;
    } else {
      return theNameOfTheRecipeController.text.isNotEmpty &&
          typeOfCookingController.text.isNotEmpty &&
          cookingStagesController.text.isNotEmpty &&
          expectedCharacteristicsController.text.isNotEmpty &&
          dateOfCreationOfTheRecipeController.text.isNotEmpty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
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
                    size: 36.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "Creating a recipe",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Container(
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            TextField(
                              controller: theNameOfTheRecipeController,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                  border: InputBorder.none, // Убираем обводку
                                  focusedBorder: InputBorder
                                      .none, // Убираем обводку при фокусе
                                  hintText: 'The name of the recipe',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16.sp)),
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                            const Divider(),
                          ],
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: typeOfCookingController,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                  border: InputBorder.none, // Убираем обводку
                                  focusedBorder: InputBorder
                                      .none, // Убираем обводку при фокусе
                                  hintText: 'Type of cooking',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16.sp)),
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                            const Divider(),
                          ],
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: cookingStagesController,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                  border: InputBorder.none, // Убираем обводку
                                  focusedBorder: InputBorder
                                      .none, // Убираем обводку при фокусе
                                  hintText: 'Cooking stages',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16.sp)),
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                            const Divider(),
                          ],
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: expectedCharacteristicsController,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                  border: InputBorder.none, // Убираем обводку
                                  focusedBorder: InputBorder
                                      .none, // Убираем обводку при фокусе
                                  hintText: 'Expected characteristics',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16.sp)),
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                            const Divider(),
                          ],
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: dateOfCreationOfTheRecipeController,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                  border: InputBorder.none, // Убираем обводку
                                  focusedBorder: InputBorder
                                      .none, // Убираем обводку при фокусе
                                  hintText: 'Date of creation of the recipe',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16.sp)),
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                            const Divider(),
                          ],
                        ),
                        for (int i = 0; i < ingridientsController.length; i++)
                          Column(
                            children: [
                              TextField(
                                controller: ingridientsController[i],
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                    border: InputBorder.none, // Убираем обводку
                                    focusedBorder: InputBorder
                                        .none, // Убираем обводку при фокусе
                                    hintText: 'Ingridients',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 16.sp)),
                                keyboardType: TextInputType.multiline,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                                onChanged: (text) {
                                  setState(() {});
                                },
                              ),
                              const Divider(),
                            ],
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                ingridientsController
                                    .add(TextEditingController());
                                setState(() {});
                              },
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
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 151.w,
                          height: 28.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  theNameOfTheRecipeController.text = "";
                                  typeOfCookingController.text = "";
                                  cookingStagesController.text = "";
                                  expectedCharacteristicsController.text = "";
                                  dateOfCreationOfTheRecipeController.text = "";

                                  ingridientsController = [
                                    TextEditingController(text: "")
                                  ];
                                  setState(() {});
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (allFieldsFilled()) {
                                    Box<RecipetModel> infoBox =
                                        Hive.box<RecipetModel>(
                                            HiveBoxes.recipetModel);
                                    Box<PartyModel> partyBox =
                                        Hive.box<PartyModel>(
                                            HiveBoxes.partyModel);

                                    RecipetModel recipetModel = RecipetModel(
                                        theNameOfTheRecipe:
                                            theNameOfTheRecipeController.text,
                                        typeOfCooking:
                                            typeOfCookingController.text,
                                        cookingStages:
                                            cookingStagesController.text,
                                        expectedCharacteristics:
                                            expectedCharacteristicsController
                                                .text,
                                        dateOfCreationOfTheRecipe:
                                            dateOfCreationOfTheRecipeController
                                                .text,
                                        ingradients: ingridientsController
                                            .map((toElement) {
                                          return toElement.text;
                                        }).toList());
                                    List<RecipetModel> addRec = partyBox
                                            .getAt(widget.index)
                                            ?.recipets ??
                                        [];
                                    addRec.add(recipetModel);

                                    partyBox.putAt(
                                        widget.index,
                                        PartyModel(
                                            nameParty: partyBox
                                                .getAt(widget.index)
                                                ?.nameParty,
                                            date: partyBox
                                                .getAt(widget.index)
                                                ?.date,
                                            volume: partyBox
                                                .getAt(widget.index)
                                                ?.volume,
                                            ingradients: partyBox
                                                .getAt(widget.index)
                                                ?.ingradients,
                                            statusParty: partyBox
                                                .getAt(widget.index)
                                                ?.statusParty,
                                            recipets: addRec));
                                    infoBox.add(recipetModel);
                                    Navigator.pop(context);
                                  }
                                },
                                child: Container(
                                  width: 61.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF0B5A21),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.r))),
                                  child: Center(
                                      child: Text(
                                    "Save",
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.white),
                                  )),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
