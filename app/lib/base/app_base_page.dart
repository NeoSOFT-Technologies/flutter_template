import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

/// Project specific Base application State based on State Management
/// Define project related common behaviour or code here if any.
abstract class AppBasePageState<T extends BasePageViewModel,
    B extends BasePage<T>> extends BaseStatefulPage<T, B> {

}
