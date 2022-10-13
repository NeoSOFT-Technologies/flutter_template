import 'dart:async';

import 'package:flutter/material.dart';

/// A [StreamBuilder] alternative that provides builder and event callbacks.
class AppStreamBuilder<T> extends StreamBuilderBase<T, AsyncSnapshot<T>> {
  final ValueChanged<T>? onData;
  final ValueChanged<Object>? onError;
  final VoidCallback? onDone;
  final T initialData;
  final WidgetBuilder? busyBuilder;
  final Widget Function(BuildContext context, T? data) dataBuilder;
  final Widget Function(BuildContext context, Object? data)? errorBuilder;

  const AppStreamBuilder({
    Key? key,
    required Stream<T> stream,
    this.onData,
    this.onError,
    this.onDone,
    required this.initialData,
    this.busyBuilder,
    required this.dataBuilder,
    this.errorBuilder,
  }) : super(key: key, stream: stream);

  @override
  AsyncSnapshot<T> initial() =>
      AsyncSnapshot<T>.withData(ConnectionState.none, initialData);

  @override
  AsyncSnapshot<T> afterConnected(AsyncSnapshot<T> current) =>
      current.inState(ConnectionState.waiting);

  @override
  AsyncSnapshot<T> afterData(AsyncSnapshot<T> current, T data) {
    try {
      if (onData != null) onData!(data);
      return AsyncSnapshot<T>.withData(ConnectionState.active, data);
    } catch (exception) {
      return afterError(current, exception, StackTrace.empty);
    }
  }

  @override
  AsyncSnapshot<T> afterError(
      AsyncSnapshot<T> current, Object error, StackTrace stackTrace) {
    if (onError != null) onError!(error);
    return AsyncSnapshot<T>.withError(ConnectionState.active, error);
  }

  @override
  AsyncSnapshot<T> afterDone(AsyncSnapshot<T> current) {
    if (onDone != null) onDone!();
    return current.inState(ConnectionState.done);
  }

  @override
  AsyncSnapshot<T> afterDisconnected(AsyncSnapshot<T> current) =>
      current.inState(ConnectionState.none);

  @override
  Widget build(BuildContext context, AsyncSnapshot<T> currentSummary) {
    switch (currentSummary.connectionState) {
      case ConnectionState.waiting:
        return _handleBusy(context);
      case ConnectionState.active:
      case ConnectionState.done:
        return _handleSnapshot(context, currentSummary);
      default:
        return _defaultWidget();
    }
  }

  Widget _handleBusy(BuildContext context) {
    if (initialData != null) {
      return _handleData(context, initialData);
    }
    if (busyBuilder == null) {
      return _defaultBusyWidget();
    }
    return busyBuilder!(context);
  }

  Widget _handleData(BuildContext context, T? data) {
    try {
      return dataBuilder(context, data);
    } catch (exception) {
      return _handleError(context, exception);
    }
  }

  Widget _handleSnapshot(BuildContext context, AsyncSnapshot<T> snapshot) {
    if (snapshot.hasError) {
      return _handleError(context, snapshot.error);
    }
    return _handleData(context, snapshot.data);
  }

  Widget _handleError(BuildContext context, Object? error) {
    if (errorBuilder != null) {
      return errorBuilder!(context, error);
    }
    return _defaultWidget();
  }

  Widget _defaultBusyWidget() => const Center(
        child: SizedBox.shrink(),
      );

  Widget _defaultWidget() => const SizedBox.shrink();
}
