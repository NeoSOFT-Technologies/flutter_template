import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/src/base_view_model.dart';

/// StatefulWidget for T type of ViewModel / ChangeNotifier
class BaseWidget<T extends BaseViewModel> extends ConsumerStatefulWidget {
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
  BaseWidgetState<T> createState() => BaseWidgetState<T>();
}

/// State of StatefulWidget of T type of Viewmodel / ChangeNotifier
class BaseWidgetState<T extends BaseViewModel> extends ConsumerState<BaseWidget<T>> {
  T? _model;


  @override
  void initState() {
    super.initState();
    _model = ref.read(widget.providerBase);

    if (_model != null) {
      if(widget.onModelReady!=null){
        widget.onModelReady!(_model!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        _model = ref.watch(widget.providerBase);
        return widget.builder(context, _model, child);
      },
      child: widget.child,
    );
  }
}
