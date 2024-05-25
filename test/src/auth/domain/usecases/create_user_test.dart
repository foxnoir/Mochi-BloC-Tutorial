// What does this class depend on?
// How can we create a fake version of a dependency?
// How do we control what the dependencies does?

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';
import 'package:mochi/src/auth/domain/usecases/create_user.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late CreateUser useCase;
  late AuthRepo repository;

// gets called before each test
// setUpAll would be called only once
  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

  test('should call [AuthRepo.createUser]', () async {
    // Arrange
    // STUB
    // createUSer is a future, so we have to use when().thenAnswer()
    // not when().thenReturn()
    // with thenAnswer we wait for the function to complete
    when(
      () => repository.createUser(
        createdAt: any(named: 'createdAt'),
        name: any(named: 'name'),
        avatar: any(named: 'avatar'),
      ),
    ).thenAnswer((_) async => const Right(null));

    // Act
    final result = await useCase(params);

    // Assert
    // expect(result, matcher)
    expect(result, equals(const Right<dynamic, void>(null)));

    // to verify that the function was called
    verify(
      () => repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      ),
    ).called(1);

    verifyNoMoreInteractions(repository);
  });
}
