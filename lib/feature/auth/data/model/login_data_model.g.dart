// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginDataModelAdapter extends TypeAdapter<LoginDataModel> {
  @override
  final int typeId = 0;

  @override
  LoginDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginDataModel(
      id: fields[0] as int,
      name: fields[1] as String,
      phone: fields[2] as String,
      image: fields[3] as String,
      token: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginDataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
