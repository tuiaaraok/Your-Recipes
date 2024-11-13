// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartyModelAdapter extends TypeAdapter<PartyModel> {
  @override
  final int typeId = 1;

  @override
  PartyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartyModel(
      nameParty: fields[0] as String?,
      date: fields[1] as String?,
      volume: fields[2] as String?,
      ingradients: (fields[3] as List?)?.cast<String>(),
      statusParty: fields[4] as ReadyStatusModel?,
      recipets: (fields[5] as List?)?.cast<RecipetModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PartyModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nameParty)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.volume)
      ..writeByte(3)
      ..write(obj.ingradients)
      ..writeByte(4)
      ..write(obj.statusParty)
      ..writeByte(5)
      ..write(obj.recipets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReadyStatusModelAdapter extends TypeAdapter<ReadyStatusModel> {
  @override
  final int typeId = 2;

  @override
  ReadyStatusModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReadyStatusModel(
      oneLineTextStringWithOneAction: fields[0] as bool,
      mashing: fields[1] as bool,
      lautering: fields[2] as bool,
      wortColection: fields[3] as bool,
      boiling: fields[4] as bool,
      cooling: fields[5] as bool,
      fermentation: fields[6] as bool,
      seconderyFermentation: fields[7] as bool,
      carbonation: fields[8] as bool,
      filtrationAndPacking: fields[9] as bool,
      aging: fields[10] as bool,
      note: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReadyStatusModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.oneLineTextStringWithOneAction)
      ..writeByte(1)
      ..write(obj.mashing)
      ..writeByte(2)
      ..write(obj.lautering)
      ..writeByte(3)
      ..write(obj.wortColection)
      ..writeByte(4)
      ..write(obj.boiling)
      ..writeByte(5)
      ..write(obj.cooling)
      ..writeByte(6)
      ..write(obj.fermentation)
      ..writeByte(7)
      ..write(obj.seconderyFermentation)
      ..writeByte(8)
      ..write(obj.carbonation)
      ..writeByte(9)
      ..write(obj.filtrationAndPacking)
      ..writeByte(10)
      ..write(obj.aging)
      ..writeByte(11)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadyStatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
