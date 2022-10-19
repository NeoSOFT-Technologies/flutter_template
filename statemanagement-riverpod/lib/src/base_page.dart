import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_core/statemanagement_core.dart';
import 'base_page_view_model.dart';
import 'base_widget.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends CoreBasePageState<VM, T> {
  /// Declare and initialization of viewModel for the page
  ProviderBase<VM> provideBase();
}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: onBaseModelReady,
        builder: (BuildContext context, VM? model, Widget? child) {
          return getLayout();
        });
  }
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase<T> providerBase;

  BasePageViewWidget(
    this.providerBase,
  );

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(
        this,
        providerBase,
      );
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase<T> providerBase;

  DataProviderElement(
    BasePageViewWidget<T> widget,
    this.providerBase,
  ) : super(widget);

  @override
  BasePageViewWidget<T> get widget => super.widget as BasePageViewWidget<T>;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model!);
      },
    );
  }
}
