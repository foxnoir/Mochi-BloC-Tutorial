import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mochi/src/auth/data/auth_repo_implementation.dart';
import 'package:mochi/src/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

// What does this class depend on?
// How can we create a fake version of a dependenccy?
// How do we control what the dependencies does?

// HOW TO WRITE TESTS FOR THIS KIND OF CLASS
//
// 1. Calling the dependency
// 2. check if methods reutrns proper data
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

  group('createUser', () {
    test(
        'should call [RemoteDayaSource.createUser] and complete successfully'
        ' when the call is successful', () async {
      // Arrange
      // STUB
      // createUSer is a future, so we have to use when().thenAnswer() not when().thenReturn()
      // with thenAnswer we wait for the fuction to complete
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

      // we given the same values, cause [remoteDataSource] calls createUser from [repoImpl] with
      // the same values
      const createdAt = 'mock.createdAt';
      const name = 'mock.name';
      const avatar = 'mock.avatar';

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
  });
}
