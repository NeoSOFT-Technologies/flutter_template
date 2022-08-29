import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../../repository/user_repository.dart';
import '../base/base_usecase.dart';
import '../base/params.dart';

class LoginUseCase extends BaseUseCase<BaseError, LoginUseCaseParams, User> {
  final UserRepository _userRepository;

  LoginUseCase(
    this._userRepository,
  );

  @override
  Future<Either<BaseError, User>> execute(
      {required LoginUseCaseParams params}) async {
    return Future.value(
      (await _userRepository.loginWithEmail(
              email: params.emailOrPhone, password: params.password))
          .fold((l) => Left(l), (result) async {
        return _userRepository.saveUser(result);
      }),
    );
  }
}

class LoginUseCaseParams extends Params {
  final String emailOrPhone;
  final String password;

  LoginUseCaseParams({
    required this.emailOrPhone,
    required this.password,
  });

  @override
  Either<AppError, bool> verify() {
    if (Validator.isEmpty(emailOrPhone)) {
      return Left(
        AppError(
          type: ErrorType.uiEmptyEmail,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else if (!Validator.validateEmail(emailOrPhone)) {
      return Left(
        AppError(
          type: ErrorType.uiInvalidEmail,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else if (Validator.isEmpty(password)) {
      return Left(
        AppError(
          type: ErrorType.uiEmptyPassword,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else {
      return Right(true);
    }
  }
}
