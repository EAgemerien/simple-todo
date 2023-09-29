import 'package:fpdart/fpdart.dart';
import 'package:simple_todo/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultFutureVoid = ResultFuture<void>;
