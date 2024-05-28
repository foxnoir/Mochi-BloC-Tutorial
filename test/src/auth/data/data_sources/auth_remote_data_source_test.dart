import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mochi/core/errors/exceptions.dart';
import 'package:mochi/core/utils/consts.dart';
import 'package:mochi/src/auth/data/data_sources/auth_remote_data_source.dart';
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
    registerFallbackValue(Uri());
  });

  group('createUser', () {
    test(
      'should complete successfully when the status code is 200 or 201',
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
        //
        // it doesn't return anything, so we test if it's complete successfully
        final methodCall = remoteDataSource.createUser;

        // here we invoke the method so we can check if it completed
        // successfully
        //
        // we use it's value to check this
        expect(
          methodCall(
            createdAt: 'createdAt',
            name: 'name',
            avatar: 'avatar',
          ),
          completes,
        );

        verify(
          () => client.post(
            Uri.parse('$kBaseUrl$kCreateUserEndpoint'),
            body: jsonEncode({
              'createdAt': 'createdAt',
              'name': 'name',
              'avatar': 'avatar',
            }),
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );

    test(
      'should throw [APIException] when the status code is mot 200 or 201',
      () async {
        // ARRANGE
        // use thenAnswer cause it's a future
        //
        // url can be any
        when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
          (_) async => http.Response('Invalid email', 400),
        );

        // ACT
        final methodCall = remoteDataSource.createUser;

        // to check if there is an error, you want the higher order function
        // to call this
        expect(
          () async => methodCall(
            createdAt: 'createdAt',
            name: 'name',
            avatar: 'avatar',
          ),
          throwsA(
            const ApiException(message: 'Invalid email', statusCode: 400),
          ),
        );

        verify(
          () => client.post(
            Uri.parse('$kBaseUrl$kCreateUserEndpoint'),
            body: jsonEncode({
              'createdAt': 'createdAt',
              'name': 'name',
              'avatar': 'avatar',
            }),
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );
  });
}
