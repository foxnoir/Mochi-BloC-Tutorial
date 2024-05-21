import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mochi/core/errors/exceptions.dart';
import 'package:mochi/core/errors/failure.dart';
import 'package:mochi/src/auth/data/auth_repo_implementation.dart';
import 'package:mochi/src/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

// What does this class depend on?
// How can we create a fake version of a dependency?
// How do we control what the dependencies does?

// HOW TO WRITE TESTS FOR THIS KIND OF CLASS
//
// 1. Calling the dependency
// 2. check if methods returns proper data
// 3. make sure that it returns the proper data if there is no exception
// otherwise:
// check if when remoteDataSource throws exception, we return a failure
// we only mock out dependencies
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource remoteDataSource;
  late AuthRepoImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    repoImpl = AuthRepoImplementation(remoteDataSource);
  });

  const ApiException tException =
      ApiException(message: 'Unknown Error Occurred', statusCode: 500);

  group('createUser', () {
    // we given the same values, cause [remoteDataSource] calls createUser from [repoImpl] with
    // the same values
    const String createdAt = 'mock.createdAt';
    const String name = 'mock.name';
    const String avatar = 'mock.avatar';

    test(
        'should call [RemoteDataSource.createUser] and complete successfully'
        ' when the call is successful', () async {
      // Arrange
      // STUB
      // createUSer is a future, so we have to use when().thenAnswer() not when().thenReturn()
      // with thenAnswer we wait for the function to complete
      //
      // the source returns void
      // void = Future.value()

      when(
        () => remoteDataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar')),
        // always return the correct value
        // don't throw an exception
      ).thenAnswer((_) async => Future.value());

      final result = await repoImpl.createUser(
          createdAt: createdAt, name: name, avatar: avatar);

      // check if getUser is called successfully and with the correct data
      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          )).called(1);

      verifyNoMoreInteractions(remoteDataSource);
    });
    test(
      'should return a [ServerFailure] when the call to the remote '
      'source is unsuccessful',
      () async {
        // Arrange
        when(
          () => remoteDataSource.createUser(
              createdAt: any(named: 'createdAt'),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')),
          // always return the correct value
          // don't throw an exception
        ).thenThrow(tException);

        final result = await repoImpl.createUser(
            createdAt: createdAt, name: name, avatar: avatar);

        expect(
            result,
            equals(Left(ApiFailure(
                message: tException.message,
                statusCode: tException.statusCode))));

        verify(() => remoteDataSource.createUser(
              createdAt: createdAt,
              name: name,
              avatar: avatar,
            )).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
// Unit Test file for auth_repo_implementation.dart