// talks to remote server outside
//
// here, when there is an error we return an error
// in domain repo we handle this result by returning a value or an error

import 'package:http/http.dart' as http;
import 'package:mochi/src/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // 1. check to make sure that it return the right data when the status
    // code is 200 or the proper response code
    //
    // 2. check to make sure that it 'THRROWS A CUSTOM EXCEPTION' with the
    // right message when status code is the bad one
    // TODO(Noir): implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() {
    // TODO(Noir): implement getUsers
    throw UnimplementedError();
  }
}
