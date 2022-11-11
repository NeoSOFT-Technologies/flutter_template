import 'package:app/feature/tabs/navigation/navigation_page_model.dart';
import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../utils/asset_icons.dart';
import '../../../widgets/platform_svg.dart';

class NavigationPageView extends BasePageViewWidget<NavigationViewModel> {
  NavigationPageView(super.providerBase, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, model) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlatformSvgWidget.asset(AssetIcons.navigation.assetName,
              color: Colors.black, width: 40, height: 40),
          Padding(
            padding:  const EdgeInsets.all(16.0),
            child: Text(
              Strings.of(context).navigation,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ],),
    );
  }
}