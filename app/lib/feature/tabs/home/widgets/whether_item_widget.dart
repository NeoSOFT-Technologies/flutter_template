import 'package:app/feature/tabs/home/widgets/timer_widget/count_down_timer_widget.dart';
import 'package:app/feature/tabs/home/widgets/timer_widget/count_down_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../../utils/asset_icons.dart';

class WhetherItemWidget extends StatelessWidget {
  final bool? isLastItem;
  final String? city;
  final String? temperature;

  const WhetherItemWidget({Key? key, this.isLastItem, this.city, this.temperature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 25, right: (isLastItem ?? false) ? 25 : 0),
      decoration: const BoxDecoration(
        color: Color(0xFFE3EBF4),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    city ?? '',
                    style: const TextStyle(
                      color: Color(0xFFA3ADBE),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "${temperature ?? ''}\u00B0",
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 20, 126, 1),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: const Image(
                  image: AssetIcons.sunCloudAngledRain,
                  height: 140,
                  width: 150,
                ),
              ),
            ],
          ),
          Expanded(
            child: BaseWidget<CountDownViewModel>(
                providerBase:
                ChangeNotifierProvider<CountDownViewModel>(
                      (ref) {
                        return CountDownViewModel(Duration(hours: DateTime
                          .now()
                          .hour, minutes: DateTime
                          .now()
                          .minute, seconds: DateTime
                          .now().
                          second));
                      },
                ),
                onModelReady: (model) {
                  model.startTimer();
                },
                builder: (context, model, child) {
                  return CountDownTimerWidget(
                    timerController: model?.timerController,);
                }),
          )
        ],
      ),
    );
  }
}
