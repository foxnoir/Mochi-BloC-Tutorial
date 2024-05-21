import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/data/models/user_model.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

// Unit Test file for user_model.dart// What does this class depend on?
// How can we create a fake version of a dependency?
// How do we control what the dependencies does?
//
//
// usermodel.dart doesn't depend on anything

// What does this class depend on?
// How can we create a fake version of a dependency?
// How do we control what the dependencies does?

void main() {
  final UserModel tModel = UserModel.empty();

//always the first thing you want to test
  test('should be a subclass of [User] entity', () {
    // arrange

    // Act
    // NO ACT cause there is no function to call/test

    // Assert
    // we just make that the [tModel] is an instance of [User]
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      // Arrange
      // already done

      // Act
      final result = UserModel.fromMap(tMap);

      // Assert
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with the right data', () {
      // Act
      final result = UserModel.fromJson(tJson);

      // Assert
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a [Map] with the right data', () {
      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] with the right data', () {
      // Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        'id': '1',
        'avatar': '_empty.avatar',
        'createdAt': '_empty.createdAt',
        'name': '_empty.name'
      });

      // Assert
      expect(result, equals(tJson));
    });
  });

  // group('copyWith', () {
  //   test('should return a [UserModel] with different data', () {
  //     // Act
  //     final result = tModel.copyWith(name: 'newName');

  //     // Assert
  //     expect(result, equals(tMap));
  //   });
  // });
}
