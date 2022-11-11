import 'package:app/feature/tabs/home/widgets/timer_widget/time_widget.dart';
import 'package:app/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';

class CountDownTimerWidget extends StatelessWidget {
  final Stream? timerController;
  const CountDownTimerWidget({Key? key,this.timerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: timerController as Stream<Duration>?,
      builder: (context, snapshot) {
          return Container(
            margin: const EdgeInsets.only(top: 20),
            padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              children: [
                TimeWidget(
                  timeText: Strings.of(context).hours,
                  timeValue: '${displayStrDigits(snapshot.data?.inHours.remainder(24) ?? 0)} : ',
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TimeWidget(
                      timeText: Strings.of(context).min,
                      timeValue:
                      '${displayStrDigits(snapshot.data?.inMinutes.remainder(60) ?? 0)} : ',
                    )),
                TimeWidget(
                  timeText: Strings.of(context).sec,
                  timeValue:
                  displayStrDigits(snapshot.data?.inSeconds.remainder(60) ?? 0),
                )
              ],
            ),
          );
      },
    );
  }
}
