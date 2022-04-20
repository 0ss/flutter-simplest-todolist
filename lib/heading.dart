// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map date = getformattedDate();

    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${date['day']}',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            Column(
              children: <Widget>[
                Text(
                  '${date['month']}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${date['year']}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Text("Thursday")
      ],
    );
  }
}

Map getformattedDate() {
  final MONTHS = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  DateTime now = DateTime.now();
  final day = now.day;
  final month = MONTHS[now.month - 1];
  final year = now.year;
  return {"day": day, "month": month, "year": year};
}
