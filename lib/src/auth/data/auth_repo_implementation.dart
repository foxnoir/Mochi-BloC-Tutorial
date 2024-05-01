// for every func in here we have a module in in the usecase folder
import 'package:dartz/dartz.dart';
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';
import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';

// talks to the data source
// data source then talks to the api / externak http lrarary
//
//
// HOW TO WRITE TESTS FOR THIS KIND OF CLASS
//
// 1. Calling the dependency
// 2. check if methods reutrns proper data
// 3. make sure that it returns the proper data if there is no exception
// otherwise:
// check if when remoteDataSource throws exception, we return a failure

class AuthRepoImplementation implements AuthRepo {
  const AuthRepoImplementation(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    await _remoteDataSource.createUser(
        createdAt: createdAt, name: name, avatar: avatar);
    return const Right(null);
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
