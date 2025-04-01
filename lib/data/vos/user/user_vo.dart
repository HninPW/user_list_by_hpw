import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../constant/hive_constant.dart';
import '../address/address_vo.dart';

part 'user_vo.g.dart';

@JsonSerializable()
@HiveType(
  typeId: kTypeIDForUserVo,
)
class UserVo{

  ///member
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'username')
  @HiveField(2)
  String? username;

  @JsonKey(name: 'email')
  @HiveField(3)
  String? email;

  @JsonKey(name: 'address')
  @HiveField(4)
  AddressVo? address;

  @JsonKey(name: 'phone')
  @HiveField(5)
  String? phone;

  @JsonKey(name: 'website')
  @HiveField(6)
  String? website;


  UserVo(this.id, this.name, this.username, this.email, this.address,
      this.phone, this.website);

  @override
  String toString() {
    return 'UserVo{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website}';
  }

///factory Constructor
factory UserVo.fromJson(Map<String,dynamic>json)=>_$UserVoFromJson(json);

Map<String, dynamic> toJson() => _$UserVoToJson(this);

}