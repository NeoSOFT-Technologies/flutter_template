import 'package:app/utils/weather_asset_util.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class FutureWeatherItemWidget extends StatelessWidget {
  final WeatherTimeline weatherTimeline;

  const FutureWeatherItemWidget({
    Key? key,
    required this.weatherTimeline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top:8),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.veryLightBlue,
                    AppColors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.clamp,
                )),
            child: Center(
              child: Image.asset(
                WeatherAssetUtil.weatherAsset(
                  weatherTimeline.weatherEnum,
                ),
                height: 50,
                width: 50,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 22,
                bottom: 22,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.black12,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: weatherTimeline.temperature.toInt().toString(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0, -14),
                          child: Text(
                            'o',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormatter.format(weatherTimeline.dateTime, DateFormatter.eeee),
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        DateFormatter.format(
                          weatherTimeline.dateTime,
                          DateFormatter.ddMMMM,
                        ),
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
