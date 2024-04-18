import 'package:dartz/dartz.dart';
import 'package:mochi/core/errrors/failure.dart';

// to create one short generic name for a type
typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
