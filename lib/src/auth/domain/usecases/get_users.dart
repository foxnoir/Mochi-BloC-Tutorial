//depends on auth_repository.dart
// calls repo func
import 'package:mochi/core/usecases/usecase.dart';
import 'package:mochi/core/utils/type_defs.dart';
import 'package:mochi/src/auth/domain/entities/user.dart';
import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';

class GetUsers extends UseCaseWithoutParams<List<User>> {
  const GetUsers(this._authRepo);

  final AuthRepo _authRepo;

  @override
  ResultFuture<List<User>> call() async => _authRepo.getUsers();
}
