import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class BottomNavigationViewModel extends BasePageViewModel {
  DashboardTab _currentTab = DashboardTab.home;

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

  static const DashboardTab home = DashboardTab._(0);
  static const DashboardTab search = DashboardTab._(1);
  static const DashboardTab navigation = DashboardTab._(2);
  static const DashboardTab profile = DashboardTab._(3);
  static const DashboardTab none = DashboardTab._(4);
}

extension DashboardTabIntExtension on int {
  DashboardTab mapToTab() {
    switch (this) {
      case 0:
        return DashboardTab.home;

      case 1:
        return DashboardTab.search;

      case 2:
        return DashboardTab.navigation;

      case 3:
        return DashboardTab.profile;

      default:
        return DashboardTab.none;
    }
  }
}
