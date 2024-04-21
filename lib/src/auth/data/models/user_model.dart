// extends the user entety
// entity is the bluprint
// model is the implementation/ extension of the blueprint

import 'dart:convert';

import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.avatar,
    required super.createdAt,
  });

  const UserModel.empty()
      : this(
          id: 'empty.id',
          name: 'empty.name',
          createdAt: 'empty.createdAt',
          avatar: 'empty.avatar',
        );

  // nullable so that you can/must only change what you want
  // if a param has not been changed, the current data is retained
  UserModel copyWidth({
    String? id,
    String? name,
    String? avatar,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          name: map['name'] as String,
          avatar: map['avatar'] as String,
          createdAt: map['created_at'] as String,
        );

  DataMap toMap() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'created_at': createdAt,
      };

  String toJson() => jsonEncode(toMap());
}
