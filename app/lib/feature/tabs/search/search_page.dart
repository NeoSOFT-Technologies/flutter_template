import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/tabs/search/search_page_model.dart';
import 'package:app/feature/tabs/search/search_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class SearchPage extends BasePage<SearchViewModel> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends BaseStatefulPage<SearchViewModel, SearchPage> {



  @override
  Widget buildView(BuildContext context, SearchViewModel model) {
    return SearchPageView(provideBase());
  }

  @override
  ProviderBase<SearchViewModel> provideBase() {
    return searchViewModelProvider;
  }
}