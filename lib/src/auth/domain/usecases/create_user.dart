//depends on auth_repository.dart
// calls repo func
import 'package:mochi/core/di/di.dart';
import 'package:mochi/src/auth/domain/repositories/auth_repo.dart';

class CreateUser {
  final AuthRepo api = DI.getIt<AuthRepo>();
}
