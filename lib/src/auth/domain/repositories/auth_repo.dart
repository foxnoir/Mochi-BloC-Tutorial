import 'package:dartz/dartz.dart';
import 'package:mochi/core/errrors/failure.dart';

abstract class AuthRepo {
  const AuthRepo();

  Future<Either<Failure, void>> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<Either<Failure, void>> getUsers();
}
