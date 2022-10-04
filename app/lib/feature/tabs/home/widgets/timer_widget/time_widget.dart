import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  String? timeValue;
  String? timeText;
  TimeWidget({Key? key,this.timeText,this.timeValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Timer Value: $timeValue");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(timeValue ?? '',
          style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500
          ),
        ),
        Flexible(
          child: Text(timeText ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
