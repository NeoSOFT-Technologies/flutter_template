import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class BottomNavigationViewModel extends BasePageViewModel {
  DashboardTab _currentTab = DashboardTab.HOME;

  DashboardTab get currentTab => _currentTab;

  setCurrentTab(DashboardTab value) {
    _currentTab = value;
    notifyListeners();
  }
}

class DashboardTab {
  final int _position;

  const DashboardTab._(this._position);

  int toInt() {
    return _position;
  }

  @override
  String toString() {
    return _position.toString();
  }

  static const DashboardTab HOME = DashboardTab._(0);
  static const DashboardTab SEARCH = DashboardTab._(1);
  static const DashboardTab NAVIGATION = DashboardTab._(2);
  static const DashboardTab PROFILE = DashboardTab._(3);
  static const DashboardTab NONE = DashboardTab._(4);
}

extension DashboardTabIntExtension on int {
  DashboardTab mapToTab() {
    switch (this) {
      case 0:
        return DashboardTab.HOME;

      case 1:
        return DashboardTab.SEARCH;

      case 2:
        return DashboardTab.NAVIGATION;

      case 3:
        return DashboardTab.PROFILE;

      default:
        return DashboardTab.NONE;
    }
  }
}