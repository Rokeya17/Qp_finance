//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../model/weather_details_model.dart';
//
// class ForecastHourItem extends StatelessWidget {
//   final Hour hour;
//   const ForecastHourItem({super.key, required this.hour});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme;
//     return Container(
//       margin: EdgeInsetsDirectional.only(end: 10),
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: theme.cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             hour.time.convertToTime(),
//             style: theme.textTheme.bodySmall,
//           ),
//           CustomCachedImage(
//             imageUrl: hour.condition.icon.addHttpPrefix(),
//             fit: BoxFit.cover,
//             width: 50,
//             height: 50,
//           ),
//           Text(
//             '${hour.tempC.toInt().toString()}${Strings.celsius.tr}',
//             style: theme.textTheme.bodySmall,
//           ),
//         ],
//       ),
//     );
//   }
// }