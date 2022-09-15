import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';

abstract class CoreBasePageState<VM, T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool subscribeVisibilityEvents = false;

  VM? _viewModel;

  bool get attached => _viewModel != null;

  final FlutterWidgetBindingObserver stateObserver =
      FlutterWidgetBindingObserverImpl();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    stateObserver.didChangeAppLifecycleState(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getLayout();
  }

  /// Returns viewModel of the screen
  VM getViewModel() {
    return attached
        ? _viewModel!
        : throw Exception("View model is not attached");
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  /// Actual Screen which load scaffold and load UI
  Widget getLayout() {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: scaffoldBackgroundColor(),
        appBar: buildAppbar(),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        body: buildScaffoldBody(context, _viewModel as VM),
        drawer: buildDrawer(),
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
        bottomNavigationBar: buildBottomNavigationBar(),
        bottomSheet: buildBottomSheet(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Building a appbar of screen
  Color scaffoldBackgroundColor() {
    return Colors.grey;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return null;
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }

  /// Building a bottomNaviagtion Bar
  Widget? buildBottomNavigationBar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool drawerEnableOpenDragGesture() {
    return false;
  }

  Widget buildScaffoldBody(BuildContext context, VM model) {
    return buildView(context, model);
  }

  @mustCallSuper
  Widget buildView(BuildContext context, VM model);

  void onBaseModelReady(VM model) {
    _viewModel = model;
    onModelReady(model);
  }

  Future<bool> onBackPressed({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
        return Future.value(false);
      } else {
        Navigator.pop(
          context,
        );
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}
}
