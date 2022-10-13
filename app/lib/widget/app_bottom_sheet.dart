import 'package:flutter/material.dart';

class AppBottomSheet {
  final Widget child;
  final BuildContext context;

  AppBottomSheet({
    required this.child,
    required this.context,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          expand: false,
          maxChildSize: 0.75,
          builder: (context, scrollController) {
            return child;
          },
        );
      },
    );
  }
}
