import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/bottom_navigation_viewmodel.dart';
import 'package:app/feature/dashboard/dashboard_page_model.dart';
import 'package:app/feature/dashboard/dashboard_page_view.dart';
import 'package:app/utils/asset_icons.dart';
import 'package:app/widgets/platform_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class DashboardPage extends BasePage<DashboardViewModel> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState
    extends BaseStatefulPage<DashboardViewModel, DashboardPage> {

  @override
  void onModelReady(DashboardViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.checkLocationPermission();
    super.onModelReady(model);
  }

  @override
  Widget buildBottomNavigationBar() {
    return BaseWidget(
        providerBase: bottomNavigationViewModelProvider,
        builder: (BuildContext context, BottomNavigationViewModel? model,
                Widget? child) =>
            BottomAppBar(
              elevation: 0,
              color: Colors.white,
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: CustomTabItem(
                        icon: PlatformSvgWidget.asset(AssetIcons.home.assetName,
                            color: Colors.grey, width: 33, height: 33),
                        title: Strings.of(context).home,
                        currentTab: DashboardTab.home,
                        selectedTab: model?.currentTab,
                        onPressed: (tab) {
                          onTabPressed(tab, model);
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTabItem(
                        icon: PlatformSvgWidget.asset(AssetIcons.search.assetName,
                            color: Colors.grey, width: 32, height: 32),
                        title: Strings.of(context).search,
                        currentTab: DashboardTab.search,
                        selectedTab: model?.currentTab,
                        onPressed: (tab) {
                          onTabPressed(tab, model);
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTabItem(
                        icon: PlatformSvgWidget.asset(
                            AssetIcons.navigation.assetName,
                            color: Colors.grey,
                            width: 32,
                            height: 32),
                        title: Strings.of(context).navigation,
                        currentTab: DashboardTab.navigation,
                        selectedTab: model?.currentTab,
                        onPressed: (tab) {
                          onTabPressed(tab, model);
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTabItem(
                        icon: PlatformSvgWidget.asset(
                            AssetIcons.profile.assetName,
                            width: 33,
                            height: 33),
                        title: Strings.of(context).profile,
                        currentTab: DashboardTab.profile,
                        selectedTab: model?.currentTab,
                        onPressed: (tab) {
                          onTabPressed(tab, model);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  void onTabPressed(DashboardTab tab, BottomNavigationViewModel? model) {
    switch (tab) {
      case DashboardTab.home:
      case DashboardTab.profile:
      case DashboardTab.search:
      case DashboardTab.navigation:
        model?.setCurrentTab(tab);
        break;
      case DashboardTab.none:
        break;
    }
  }

  @override
  Widget buildView(BuildContext context, DashboardViewModel model) {
    return DashboardPageView(provideBase());
  }

  @override
  ProviderBase<DashboardViewModel> provideBase() {
    return dashboardViewModelProvider;
  }
}

class CustomTabItem extends StatelessWidget {
  final ThemeData? theme;
  final String? title;
  final Widget? icon;
  final DashboardTab currentTab;
  final DashboardTab? selectedTab;
  final Function(DashboardTab currentTab)? onPressed;

  const CustomTabItem({Key? key,
    this.theme,
    this.currentTab = DashboardTab.none,
    this.icon,
    this.selectedTab,
    this.title,
    this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(1),
      onPressed: () {
        if (currentTab != selectedTab) {
          onPressed?.call(currentTab);
        }
      },
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Visibility(
              visible: currentTab != selectedTab, child: icon ?? Container()),
          Visibility(
            visible: currentTab == selectedTab,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Icon(
                    Icons.circle,
                    size: 8,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
