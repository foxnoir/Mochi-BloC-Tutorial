// for every func in here we have a module in in the usecase folder
import 'package:injectable/injectable.dart';
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();

  @factoryMethod
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  @factoryMethod
  ResultFuture<List<User>> getUsers();
}
