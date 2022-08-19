import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement_core/statemanagement_core.dart';

import 'base_page_view_model.dart';

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
  final T bloc;

  BasePageViewWidget(this.bloc);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(this, bloc);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final T bloc;

  DataProviderElement(BasePageViewWidget widget, this.bloc) : super(widget);

  @override
  BasePageViewWidget get widget => super.widget as BasePageViewWidget;

  @override
  Widget build() {
    return BlocProvider<T>(
      create: (context) => bloc,
      child: widget.build(this, bloc),
    );
  }
}
