import 'package:hive/hive.dart';
part 'recipet_model.g.dart';

@HiveType(typeId: 3)
class RecipetModel {
  @HiveField(0)
  String? theNameOfTheRecipe;
  @HiveField(1)
  String? typeOfCooking;
  @HiveField(2)
  String? cookingStages;
  @HiveField(3)
  String? expectedCharacteristics;
  @HiveField(4)
  String? dateOfCreationOfTheRecipe;
  @HiveField(5)
  List<String>? ingradients;
  RecipetModel(
      {this.theNameOfTheRecipe,
      this.typeOfCooking,
      this.cookingStages,
      this.expectedCharacteristics,
      this.dateOfCreationOfTheRecipe,
      this.ingradients});
}
