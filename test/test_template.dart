// // What does this class depend on?
// // How can we create a fake version of a dependency?
// // How do we control what the dependencies does?

// import 'package:http/http.dart' as http;
// import 'package:mocktail/mocktail.dart';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';
// import 'package:mochi/src/auth/domain/usecases/create_user.dart';
// import 'package:mocktail/mocktail.dart';

// class MockClient extends Mock implements http.Client {}

// void main() {
// // gets called before each test
// // setUpAll would be called only once
//   setUp(() {});

//   group('createUser', () {
 

//     test(
//         'should call [RemoteDataSource.createUser] and complete successfully '
//         'when the call is successful', () async {
//       when(
//         () => remoteDataSource.createUser(
//           createdAt: any(named: 'createdAt'),
//           name: any(named: 'name'),
//           avatar: any(named: 'avatar'),
//         ),
//       ).thenAnswer((_) async => Future.value());

//       final result = await repoImpl.createUser(
//         createdAt: createdAt,
//         name: name,
//         avatar: avatar,
//       );

//       expect(result, equals(const Right<Failure, void>(null)));
//       verify(
//         () => remoteDataSource.createUser(
//           createdAt: createdAt,
//           name: name,
//           avatar: avatar,
//         ),
//       ).called(1);

//       verifyNoMoreInteractions(remoteDataSource);
//     });
//   });
// }
