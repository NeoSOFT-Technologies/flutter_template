import 'package:app/feature/tabs/home/widgets/whether_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';

class WhetherListWidget extends StatelessWidget {
  const WhetherListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return WhetherItemWidget(
              isLastItem: index == 2,
              city: Strings.of(context).newYorkStaticText,
              temperature: Strings.of(context).degreeStaticText,
            );
          }),
    );
  }
}
