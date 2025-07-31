import 'package:flutter/material.dart';

Container searchItem() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffdddddd))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Text('부산광역시청', style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '부산광역시 연제구 중앙대로 1001 부산광역시청',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }