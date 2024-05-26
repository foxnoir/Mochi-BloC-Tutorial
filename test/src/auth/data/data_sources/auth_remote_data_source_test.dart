// What does this class depend on?
// How can we create a fake version of a dependency?
// How do we control what the dependencies does?

import 'package:http/http.dart' as http;
import 'package:mochi/src/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';
import 'package:mochi/src/auth/domain/usecases/create_user.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late AuthRemoteDataSourceImpl remoteDataSource;

// gets called before each test
// setUpAll would be called only once
  setUp(() {
    client = MockClient();
    remoteDataSource = AuthRemoteDataSourceImpl(client);
  });

  test('should call [AuthRepo.createUser]', () async {
    // Arrange

    group('createUser', () {
      test('should complete successfully when the status code is 200 or 2001',
          () async {
        // ARRANGE
        // use thenAnswer cause it's a future
        //
        // url can be any
        when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
          (_) async => http.Response('User created successfully', 201),
        );

        // ACT
        // when this method is calles with these params it should complete
        // successfully
        final methodCall = remoteDataSource.createUser;

        // expect(
        //   methodCall(
        //     createdAt: 'createdAt',
        //     name: 'name',
        //     avatar: 'avatar',
        //   ),
        //   completes,
        // );
        // verify(
        //   () => remoteDataSource.createUser(
        //     createdAt: createdAt,
        //     name: name,
        //     avatar: avatar,
        //   ),
        // ).called(1);

        // verifyNoMoreInteractions(remoteDataSource);
      });
    });
  });
}
