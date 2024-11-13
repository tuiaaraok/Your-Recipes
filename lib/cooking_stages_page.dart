import 'package:bear/model/boxes.dart';
import 'package:bear/model/party_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CookingStagesPage extends StatefulWidget {
  const CookingStagesPage({super.key, required this.index});
  final int index;

  @override
  State<CookingStagesPage> createState() {
    return _CookingStagesPageState();
  }
}

class _CookingStagesPageState extends State<CookingStagesPage> {
  List<bool> ready = List.filled(11, false);
  List<String> nameCategory = [
    "One line text string with one action",
    "Mashing",
    "Lautering",
    "Wort Colection",
    "Boiling",
    "Cooling",
    "Fermentation",
    "Secondery Fermentation",
    "Carbonation",
    "Filtration and packing",
    "Aging"
  ];
  @override
  initState() {
    super.initState();

    if (partyBox.getAt(widget.index)?.statusParty != null) {
      ready[0] = partyBox
          .getAt(widget.index)!
          .statusParty!
          .oneLineTextStringWithOneAction;

      ready[1] = partyBox.getAt(widget.index)!.statusParty!.mashing;

      ready[2] = partyBox.getAt(widget.index)!.statusParty!.lautering;

      ready[3] = partyBox.getAt(widget.index)!.statusParty!.wortColection;
      ready[4] = partyBox.getAt(widget.index)!.statusParty!.boiling;

      ready[5] = partyBox.getAt(widget.index)!.statusParty!.cooling;

      ready[6] = partyBox.getAt(widget.index)!.statusParty!.fermentation;
      ready[7] =
          partyBox.getAt(widget.index)!.statusParty!.seconderyFermentation;
      ready[8] = partyBox.getAt(widget.index)!.statusParty!.carbonation;
      ready[9] =
          partyBox.getAt(widget.index)!.statusParty!.filtrationAndPacking;
      ready[10] = partyBox.getAt(widget.index)!.statusParty!.aging;
      noteController = TextEditingController(
          text: partyBox.getAt(widget.index)!.statusParty?.note == null
              ? ""
              : partyBox.getAt(widget.index)!.statusParty!.note);

      setState(() {});
    }
  }

  TextEditingController noteController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  Box<PartyModel> partyBox = Hive.box<PartyModel>(HiveBoxes.partyModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top,
      ),
      child: KeyboardActions(
        config: KeyboardActionsConfig(nextFocus: false, actions: [
          KeyboardActionsItem(
            focusNode: _nodeText1,
          ),
        ]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 56.h,
                color: const Color(0xFF0B5A21),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          partyBox.putAt(
                              widget.index,
                              PartyModel(
                                  nameParty:
                                      partyBox.getAt(widget.index)?.nameParty,
                                  date: partyBox.getAt(widget.index)?.date,
                                  volume: partyBox.getAt(widget.index)?.volume,
                                  ingradients:
                                      partyBox.getAt(widget.index)?.ingradients,
                                  statusParty: ReadyStatusModel(
                                      oneLineTextStringWithOneAction: ready[0],
                                      mashing: ready[1],
                                      lautering: ready[2],
                                      wortColection: ready[3],
                                      boiling: ready[4],
                                      cooling: ready[5],
                                      fermentation: ready[6],
                                      seconderyFermentation: ready[7],
                                      carbonation: ready[8],
                                      filtrationAndPacking: ready[9],
                                      aging: ready[10],
                                      note: noteController.text),
                                  recipets:
                                      partyBox.getAt(widget.index)?.recipets));
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 36.w,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        partyBox
                            .getAt(widget.index)!
                            .nameParty
                            .toString()
                            .toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.87.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 36.w,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              for (int i = 0; i < ready.length; i++)
                SizedBox(
                  width: 360.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              nameCategory[i],
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            CupertinoSwitch(
                              value: ready[i],
                              onChanged: (value) {
                                setState(() {
                                  ready[i] = value;
                                });
                              },
                            ),
                          ],
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Container(
                  width: 360.w,
                  height: 81.h,
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
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: TextField(
                      minLines: 1,
                      maxLines:
                          null, // Позволяет полю расширяться по мере добавления строк
                      controller: noteController,
                      focusNode: _nodeText1,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                          border: InputBorder.none, // Убираем обводку
                          focusedBorder:
                              InputBorder.none, // Убираем обводку при фокусе
                          hintText: 'Enter a note',
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
