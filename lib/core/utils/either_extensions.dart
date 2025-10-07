import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R getRight() => (this as Right<L, R>).value;
  L getLeft() => (this as Left<L, R>).value;

  T foldWith<T>({required T Function(L failure) failure, required T Function(R data) success}) {
    return fold(failure, success);
  }

  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => f(r),
    );
  }
}
