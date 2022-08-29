import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class Params {
  final bool reloading;

  Params({this.reloading = false});

  Either<AppError, bool> verify();
}
