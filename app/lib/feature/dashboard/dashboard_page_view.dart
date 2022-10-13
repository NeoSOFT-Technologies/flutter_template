import 'package:app/feature/dashboard/dashboard_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class DashboardPageView extends BasePageViewWidget<DashboardPageViewModel> {
  DashboardPageView(ProviderBase<DashboardPageViewModel> model) : super(model);

  @override
  Widget build(BuildContext context, model) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.grey,
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Text("Dashboard weather app"),
        ),
      ),
    );
  }
}
