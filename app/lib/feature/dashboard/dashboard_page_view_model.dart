import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';

@injectable
class DashboardPageViewModel extends BasePageViewModel {
  final CreateLocationUseCase createLocationUseCase;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  DashboardPageViewModel(this.createLocationUseCase, this.exceptionHandlerBinder) {}

  void createLocation({
    required String name,
    required double lat,
    required double lan,
  }) {
    exceptionHandlerBinder.handle(block: (){
      CreateLocationUseCaseParams params = CreateLocationUseCaseParams(
        name: name,
        lan: lan,
        lat: lat,
      );
      RequestManager<Location>(
        params,
        createCall: () => createLocationUseCase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          print("location name is ${result.data?.name}");
          print("location id is ${result.data?.locationId}");
        }
      });
    }).execute();
  }
}
