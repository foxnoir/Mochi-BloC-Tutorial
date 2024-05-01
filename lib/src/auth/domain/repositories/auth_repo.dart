// for every func in here we have a module in in the usecase folder
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';

// defines params, func signature and return types of user

abstract class AuthRepo {
  const AuthRepo();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}
