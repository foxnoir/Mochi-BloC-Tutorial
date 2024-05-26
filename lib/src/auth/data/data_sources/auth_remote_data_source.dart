// talks to remote server outside
//
// here, when there is an error we return an error
// in domain repo we handle this result by returning a value or an error

import 'package:mochi/src/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}
