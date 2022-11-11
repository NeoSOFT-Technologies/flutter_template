import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final String? timeValue;
  final String? timeText;
  const TimeWidget({Key? key,this.timeText,this.timeValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              color: Color(0xFFA3ADBE),
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
