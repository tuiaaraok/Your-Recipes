import 'package:bear/model/recipet_model.dart';
import 'package:hive/hive.dart';
part 'party_model.g.dart';

@HiveType(typeId: 1)
class PartyModel {
  @HiveField(0)
  String? nameParty;
  @HiveField(1)
  String? date;
  @HiveField(2)
  String? volume;
  @HiveField(3)
  List<String>? ingradients;
  @HiveField(4)
  ReadyStatusModel? statusParty;
  @HiveField(5)
  List<RecipetModel>? recipets;
  PartyModel(
      {this.nameParty,
      this.date,
      this.volume,
      this.ingradients,
      this.statusParty,
      this.recipets});
}

@HiveType(typeId: 2)
class ReadyStatusModel {
  @HiveField(0)
  bool oneLineTextStringWithOneAction = false;
  @HiveField(1)
  bool mashing = false;
  @HiveField(2)
  bool lautering = false;
  @HiveField(3)
  bool wortColection = false;
  @HiveField(4)
  bool boiling = false;
  @HiveField(5)
  bool cooling = false;
  @HiveField(6)
  bool fermentation = false;
  @HiveField(7)
  bool seconderyFermentation = false;
  @HiveField(8)
  bool carbonation = false;
  @HiveField(9)
  bool filtrationAndPacking = false;
  @HiveField(10)
  bool aging = false;
  @HiveField(11)
  String? note;
  ReadyStatusModel(
      {required this.oneLineTextStringWithOneAction,
      required this.mashing,
      required this.lautering,
      required this.wortColection,
      required this.boiling,
      required this.cooling,
      required this.fermentation,
      required this.seconderyFermentation,
      required this.carbonation,
      required this.filtrationAndPacking,
      required this.aging,
      this.note});
}
