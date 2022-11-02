import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/src/base_view_model.dart';

/// StatefulWidget for T type of ViewModel / ChangeNotifier
class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T? model, Widget? child) builder;
  final ProviderBase<T> providerBase;
  final Function(T)? onModelReady;
  final Widget? child;

  BaseWidget({
    Key? key,
    required this.builder,
    required this.providerBase,
    this.onModelReady,
    this.child,
  }) : super(key: key);

  @override
  State<BaseWidget<T>> createState() => _BaseWidget<T>();
}

/// State of StatefulWidget of T type of Viewmodel / ChangeNotifier
class _BaseWidget<T extends BaseViewModel> extends State<BaseWidget<T>> {
  T? _model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        _model = ref.watch(widget.providerBase);
        widget.onModelReady?.call(_model!);
        return widget.builder(context, _model, child);
      },
      child: widget.child,
    );
  }
}
