// talks to remote server outside
//
// here, when there is an error we return an error
// in domain repo we handle this result by returning a value or an error

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mochi/core/errors/exceptions.dart';
import 'package:mochi/core/utils/consts.dart';
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/data/models/user_model.dart';

const kCreateUserEndpoint = '/test-api/users';
const kGetUsersEndpoint = '/test-api/user';

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
    try {
      final response = await _client.post(
        Uri.parse('$kBaseUrl$kCreateUserEndpoint'),
        body: jsonEncode({
          'createdAt': createdAt,
          'name': name,
          'avatar': avatar,
        }),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ApiException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      // we rethrow it, cause otherwise it would be overwritten and we wouldn't
      // know what went wrong
      rethrow;
    } catch (e) {
      // if that's thrown, it's probably a client side failure => special
      // 505 so we don't get conflicts with possible server side statusCodes
      // something is broken in our code
      throw ApiException(message: '$e', statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await _client.get(
      Uri.parse('$kBaseUrl$kCreateUserEndpoint'),
    );
    if (response.statusCode == 200) {
      List<DataMap> jsonList =
          List<DataMap>.from(jsonDecode(response.body) as List);
      return jsonList.map((json) => UserModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
