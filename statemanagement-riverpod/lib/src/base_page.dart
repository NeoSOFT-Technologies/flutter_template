import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_page_view_model.dart';
import 'base_widget.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends CoreBasePageState<VM, T> {}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  @override
  Widget build(BuildContext context) {
    return getLayout();
  }
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase providerBase;

  BasePageViewWidget(this.providerBase);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() =>
      DataProviderElement<T>(this, this.providerBase);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase providerBase;

  DataProviderElement(BasePageViewWidget widget, this.providerBase)
      : super(widget);

  @override
  BasePageViewWidget get widget => super.widget as BasePageViewWidget;

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
