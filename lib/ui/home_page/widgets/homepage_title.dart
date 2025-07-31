import 'package:flutter/material.dart';

Container homepageTitle() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '간편하게 검색하세요!',
          style: TextStyle(fontSize: 14, color: Color(0xff36495b)),
        ),
        Text(
          '우리 지역 검색 앱',
          style: TextStyle(
            fontSize: 23,
            color: Color(0xff36495b),
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}
