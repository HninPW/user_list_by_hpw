import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../constant/hive_constant.dart';

part 'address_vo.g.dart';

@JsonSerializable()
@HiveType(
  typeId: kTypeIDForAddressVo,
)
class AddressVo{

  ///member
  @JsonKey(name: 'street')
  @HiveField(0)
  String? street;

  @JsonKey(name: 'suite')
  @HiveField(1)
  String? suite;

  @JsonKey(name: 'city')
  @HiveField(2)
  String? city;

  @JsonKey(name: 'zipcode')
  @HiveField(3)
  String? zipcode;


  AddressVo(this.street, this.suite, this.city, this.zipcode);

  @override
  String toString() {
    return 'AddressVo{street: $street, suite: $suite, city: $city, zipcode: $zipcode}';
  }

///factory Constructor
factory AddressVo.fromJson(Map<String,dynamic>json)=>_$AddressVoFromJson(json);

Map<String, dynamic> toJson() => _$AddressVoToJson(this);

}