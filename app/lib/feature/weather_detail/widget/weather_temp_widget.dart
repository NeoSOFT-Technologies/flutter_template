import 'package:app/utils/weather_asset_util.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class WeatherTempWidget extends StatelessWidget {
  final String temperature;
  final WeatherEnum weatherEnum;

  const WeatherTempWidget({
    Key? key,
    required this.temperature,
    required this.weatherEnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.white.withAlpha(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: temperature,
                    style: TextStyle(
                      fontSize: 150,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: const Offset(0, 4),
                      child: Text(
                        'o',
                        style: TextStyle(
                          fontSize: 50,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: -140,
            child: Image.asset(
              WeatherAssetUtil.weatherAsset(
                weatherEnum,
              ),
              height: 200,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
