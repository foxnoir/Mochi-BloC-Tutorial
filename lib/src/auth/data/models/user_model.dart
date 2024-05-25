// extends the user entety
// entity is the bluprint
// model is the implementation/ extension of the blueprint
//
//
// actual implementation of the user entity
import 'dart:convert';
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.avatar,
    required super.id,
    required super.createdAt,
    required super.name,
  });

  const UserModel.empty()
      : this(
          id: '1',
          avatar: '_empty.avatar',
          createdAt: '_empty.createdAt',
          name: '_empty.name',
        );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          avatar: map['avatar'] as String,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
        );

  UserModel copyWith({
    String? id,
    String? avatar,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }

  DataMap toMap() => {
        'id': id,
        'avatar': avatar,
        'createdAt': createdAt,
        'name': name,
      };

  String toJson() => jsonEncode(toMap());
}
