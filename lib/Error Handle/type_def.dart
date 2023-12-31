import 'package:fpdart/fpdart.dart';
import 'package:tasksync/Error%20Handle/Failure.dart';


typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureVoid<T> = FutureEither<void>;
