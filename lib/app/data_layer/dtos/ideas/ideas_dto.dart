import '../../../domain_layer/domain_layer.dart';

class IdeasDTO extends IdeasEntity {
  IdeasDTO({
    required super.highLightText,
    required super.userNickname,
    required super.userImage,
    required super.imageUrl,
    required super.description,
    required super.verified,
  });

  factory IdeasDTO.fromJson(Map<String, dynamic> json) {
    return IdeasDTO(
      highLightText: json['highLightText'],
      userNickname: json['userNickname'].toLowerCase(),
      userImage: json['userImage'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      verified: json['verified'],
    );
  }
}
