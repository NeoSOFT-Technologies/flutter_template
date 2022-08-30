import 'package:statemanagement_bloc/src/base_event.dart';
import 'package:statemanagement_bloc/src/base_state.dart';
import 'base_view_model.dart';

class BasePageViewModel<T extends BaseEvent, S extends BaseState>
    extends BaseViewModel<T, S> {
  BasePageViewModel(super.initialState);
}
