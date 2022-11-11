import 'package:app/feature/tabs/search/search_page_model.dart';
import 'package:app/widgets/platform_svg.dart';
import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../utils/asset_icons.dart';

class SearchPageView extends BasePageViewWidget<SearchViewModel> {
  SearchPageView(super.providerBase, {Key? key}) : super(key: key);


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
        PlatformSvgWidget.asset(AssetIcons.search.assetName,
            color: Colors.black, width: 40, height: 40),
        Padding(
          padding:  const EdgeInsets.all(16.0),
          child: Text(
            Strings.of(context).search,
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