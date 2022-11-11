import 'package:app/feature/weather_detail/weather_detail_view_model.dart';
import 'package:app/feature/weather_detail/widget/future_weather_item_widget.dart';
import 'package:app/feature/weather_detail/widget/weather_temp_widget.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/widget/app_bottom_sheet.dart';
import 'package:app/widget/data_status_widget.dart';
import 'package:app/widget/title_value_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:themes/themes.dart';

class WeatherDetailPageView extends BasePageViewWidget<WeatherDetailViewModel> {
  WeatherDetailPageView(ProviderBase<WeatherDetailViewModel> model, {Key? key}) : super(key: key, model);

  @override
  Widget build(BuildContext context, model) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightBlue,
            AppColors.darkBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.clamp,
        ),
      ),
      child: AppStreamBuilder<Resource<WeatherDetail>>(
        initialData: Resource.none(),
        stream: model.weatherResponse,
        dataBuilder: (context, data) {
          return DataStatusWidget(
            status: data?.status ?? Status.none,
            loadingWidget: () {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              );
            },
            successWidget: () {
              List<WeatherTimeline> weatherTimeline = data?.data?.weatherTimeline ?? [];
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      model.weatherDetailPageParam.location.name,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      Strings.of(context).todayWeather,
                      style: TextStyle(
                        color: AppColors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  WeatherTempWidget(
                    temperature: data?.data?.weatherTimeline.first.temperature.toInt().toString() ?? '',
                    weatherEnum: WeatherEnum.cloudy,
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 22,
                      right: 22,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleValueWidget(
                          title: Strings.of(context).wind,
                          value: data?.data?.weatherTimeline.first.wind.toString() ?? '',
                        ),
                        TitleValueWidget(
                          title: Strings.of(context).humidity,
                          value: data?.data?.weatherTimeline.first.humidity.toString() ?? '',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  InkWell(
                    onTap: () {
                      AppBottomSheet(
                        child: Container(
                          height: 500,
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Center(
                                child: Container(
                                  width: 100,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.lightBlue,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                child: Text(
                                  Strings.of(context).futureWeather,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        top: index == 0 ? 32 : 0,
                                      ),
                                      child: FutureWeatherItemWidget(
                                        weatherTimeline: weatherTimeline[index],
                                      ),
                                    );
                                  },
                                  shrinkWrap: true,
                                  itemCount: weatherTimeline.length,
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 30,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        context: context,
                      );
                    },
                    child: Text(
                      DateFormatter.format(DateTime.now(), DateFormatter.eeeeddMMMM),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
