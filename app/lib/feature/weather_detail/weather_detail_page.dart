import 'package:app/feature/weather_detail/weather_detail_page_view.dart';
import 'package:app/feature/weather_detail/weather_detail_view_model.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:app/di/states/viewmodels.dart';

class WeatherDetailPage extends BasePage<WeatherDetailViewModel> {
  final WeatherDetailPageParam param;

  const WeatherDetailPage({
    Key? key,
    required this.param,
  }) : super(key: key);

  @override
  WeatherDetailPageState createState() => WeatherDetailPageState();
}

class WeatherDetailPageState extends BaseStatefulPage<WeatherDetailViewModel, WeatherDetailPage> {
  @override
  ProviderBase<WeatherDetailViewModel> provideBase() {
    return weatherDetailViewModelProvider.call(
      widget.param,
    );
  }

  @override
  void onModelReady(WeatherDetailViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  Widget buildView(BuildContext context, WeatherDetailViewModel model) {
    return WeatherDetailPageView(
      provideBase(),
    );
  }
}

class WeatherDetailPageParam {
  final Location location;

  WeatherDetailPageParam(this.location);
}
