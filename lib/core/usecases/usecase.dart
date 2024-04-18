import 'package:mochi/core/utils/type_defs.dart';

// only two types of usecase: with or without params
// 'call' makes the class callable
abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}
