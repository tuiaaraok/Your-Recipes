// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipetModelAdapter extends TypeAdapter<RecipetModel> {
  @override
  final int typeId = 3;

  @override
  RecipetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipetModel(
      theNameOfTheRecipe: fields[0] as String?,
      typeOfCooking: fields[1] as String?,
      cookingStages: fields[2] as String?,
      expectedCharacteristics: fields[3] as String?,
      dateOfCreationOfTheRecipe: fields[4] as String?,
      ingradients: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipetModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.theNameOfTheRecipe)
      ..writeByte(1)
      ..write(obj.typeOfCooking)
      ..writeByte(2)
      ..write(obj.cookingStages)
      ..writeByte(3)
      ..write(obj.expectedCharacteristics)
      ..writeByte(4)
      ..write(obj.dateOfCreationOfTheRecipe)
      ..writeByte(5)
      ..write(obj.ingradients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
