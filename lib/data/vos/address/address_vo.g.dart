// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressVoAdapter extends TypeAdapter<AddressVo> {
  @override
  final int typeId = 2;

  @override
  AddressVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressVo(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressVo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressVo _$AddressVoFromJson(Map<String, dynamic> json) => AddressVo(
      json['street'] as String?,
      json['suite'] as String?,
      json['city'] as String?,
      json['zipcode'] as String?,
    );

Map<String, dynamic> _$AddressVoToJson(AddressVo instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
    };
