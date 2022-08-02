import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StatefulWidget for T type of ViewModel / ChangeNotifier
class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T? model, Widget? child) builder;
  final ProviderBase providerBase;
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
  _BaseWidget<T> createState() => _BaseWidget<T>();
}

/// State of StatefulWidget of T type of Viewmodel / ChangeNotifier
class _BaseWidget<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T? _model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        _model = watch(widget.providerBase as ProviderBase<Object?, T>);
        widget.onModelReady?.call(_model!);
        return widget.builder(context, _model, child);
      },
      child: widget.child,
    );
  }
}
