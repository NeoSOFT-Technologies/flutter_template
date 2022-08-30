import 'package:bloc/bloc.dart';
import 'package:statemanagement_bloc/src/base_event.dart';
import 'package:statemanagement_bloc/src/base_state.dart';

class BaseViewModel<T extends BaseEvent, S extends BaseState>
    extends Bloc<T, S> {
  BaseViewModel(super.initialState);
}
