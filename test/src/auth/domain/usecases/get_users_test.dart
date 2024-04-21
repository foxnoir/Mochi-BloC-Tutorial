// What does this class depend on?
// How can we create a fake version of a dependenccy?
// How do we control what the dependencies does?

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mochi/core/errrors/failure.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';
import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';
import 'package:mochi/src/auth/domain/usecases/create_user.dart';
import 'package:mochi/src/auth/domain/usecases/get_users.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late GetUsers useCase;
  late AuthRepo repository;

// gets called before each test
// setUpAll woukld be called only once
  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUsers(repository);
  });

  const List<User> tResponse = [User.empty()];

  test('should call [AuthRepo.getUsers] and reurn [List<User>]', () async {
    // Arrange
    when(
      () => repository.getUsers(),
    ).thenAnswer((_) async => const Right(tResponse));

    // Act
    final Either<Failure, List<User>> result = await useCase();

    // Assert
    // expect(result, matcher)
    expect(result, equals(const Right<dynamic, List<User>>(tResponse)));

    // to verify that the function was called
    verify(() => repository.getUsers()).called(1);

    verifyNoMoreInteractions(repository);
  });
}
