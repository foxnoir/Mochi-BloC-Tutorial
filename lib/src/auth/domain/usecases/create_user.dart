//depends on auth_repository.dart
// calls repo func
import 'package:equatable/equatable.dart';
import 'package:mochi/core/usecases/usecase.dart';
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  const CreateUser(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture call(CreateUserParams params) async => _authRepo.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

// makes it easier to test
  const CreateUserParams.empty()
      : createdAt = 'empty.createdAt',
        name = 'empty.name',
        avatar = 'empty.avatar';

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object> get props => [createdAt, name, avatar];
}
