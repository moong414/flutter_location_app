import 'package:flutter/material.dart';

Container reviewItem() {
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.play_arrow),
          Text('ddddd')
        ],),
        Text('ddd'),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(12, 3, 12, 5),
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            '공공, 사회기관 > 특별, 광역시청',
            style: TextStyle(
              color: Color(0xff999999),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ],
    ),
  );
}
