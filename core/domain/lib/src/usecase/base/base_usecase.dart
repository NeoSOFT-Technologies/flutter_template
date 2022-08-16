import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';
import 'params.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute({required P params});
}
