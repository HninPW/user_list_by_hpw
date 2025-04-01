// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserVoAdapter extends TypeAdapter<UserVo> {
  @override
  final int typeId = 1;

  @override
  UserVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserVo(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as AddressVo?,
      fields[5] as String?,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserVo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.website);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVo _$UserVoFromJson(Map<String, dynamic> json) => UserVo(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['username'] as String?,
      json['email'] as String?,
      json['address'] == null
          ? null
          : AddressVo.fromJson(json['address'] as Map<String, dynamic>),
      json['phone'] as String?,
      json['website'] as String?,
    );

Map<String, dynamic> _$UserVoToJson(UserVo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
    };
