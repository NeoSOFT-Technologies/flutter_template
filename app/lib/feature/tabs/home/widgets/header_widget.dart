import 'package:app/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(displayGreeting(context),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontWeight: FontWeight.bold,

            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(parseDateTime(DateTime.now()),
              style: const TextStyle(
                color: Color(0XFFA3ADBE),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
