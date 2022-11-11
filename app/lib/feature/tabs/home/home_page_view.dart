import 'package:app/feature/tabs/home/widgets/favourite_whether_widget.dart';
import 'package:app/feature/tabs/home/widgets/header_widget.dart';
import 'package:app/feature/tabs/home/widgets/whether_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'home_page_model.dart';

class HomePageView extends BasePageViewWidget<HomePageViewModel> {
  HomePageView(super.providerBase, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const WhetherListWidget()),
              FavouriteWhetherWidget(
                temperature: Strings.of(context).favDegreeStaticText,
                city: Strings.of(context).losAngelesStaticText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
