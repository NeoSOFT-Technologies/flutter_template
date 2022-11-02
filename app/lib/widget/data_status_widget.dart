import 'package:app/model/resource.dart';
import 'package:flutter/material.dart';

class DataStatusWidget extends StatelessWidget {
  final Status status;
  final Function? loadingWidget;
  final Function? successWidget;
  final Function? errorWidget;

  const DataStatusWidget({
    Key? key,
    required this.status,
    this.loadingWidget,
    this.successWidget,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.error:
        return errorWidget?.call();
      case Status.loading:
        return loadingWidget?.call();
      case Status.reloading:
        return loadingWidget?.call();
      case Status.success:
        return successWidget?.call();
      case Status.none:
        return const SizedBox();
    }
  }
}
