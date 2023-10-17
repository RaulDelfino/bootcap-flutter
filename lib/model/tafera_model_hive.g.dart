// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tafera_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TarefaModelHiveAdapter extends TypeAdapter<TarefaModelHive> {
  @override
  final int typeId = 1;

  @override
  TarefaModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TarefaModelHive()
      ..descricao = fields[0] as String
      ..concluido = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, TarefaModelHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.descricao)
      ..writeByte(1)
      ..write(obj.concluido);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TarefaModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
