import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';

import '../../../../utils/asset_icons.dart';

class FavouriteWhetherWidget extends StatelessWidget {
  final String? city;
  final String? temperature;
  const FavouriteWhetherWidget({Key? key,this.city,this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50,),
      margin: const EdgeInsets.only(left: 25,right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(Strings.of(context).yourFav,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
           Container(
            padding: const EdgeInsets.all(28),
            margin: const EdgeInsets.only(top: 25),
            decoration: const BoxDecoration(
              color: Color(0xFFE3EBF4),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(city ?? '',
                            style: const TextStyle(
                              color: Color(0xFFA3ADBE),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text("${temperature ?? ''}\u00B0",
                              style: const TextStyle(
                                color: Color.fromRGBO(0,20,126, 1),
                                fontSize: 55,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                     const Image(
                      image:  AssetIcons.bigRain,
                      height:160,
                      width: 160,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
