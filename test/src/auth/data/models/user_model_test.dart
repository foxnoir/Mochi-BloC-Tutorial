// Unit Test file for user_model.dart// What does this class depend on?
// How can we create a fake version of a dependenccy?
// How do we control what the dependencies does?
//
//
// usermodel.dart doesn't depend on anything

// What does this class depend on?
// How can we create a fake version of a dependenccy?
// How do we control what the dependencies does?

import 'package:flutter_test/flutter_test.dart';
import 'package:mochi/src/auth/data/models/user_model.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';

void main() {
//always the first thing you want to test
  test('should be a subclass of [User] entity', () {
    // arrange
    final tModel = UserModel.empty();

    // Act
// NO ACT cause there is no function to call/test

// Assert
// we just make that the [tModle] is an instance of [User]
    expect(tModel, isA<User>());
  });
}
