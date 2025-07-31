import 'package:flutter/material.dart';

Container reviewItem() {
  return Container(
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.play_arrow, size: 16, color: Colors.grey,),
          SizedBox(width: 4,),
          Text('Review', style: TextStyle(fontSize: 14, color: Color(0xff888888)),)
        ],),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 14),
          child: Text('이안류에 휩쓸려갈뻔 했어요.', style: TextStyle(fontSize: 16, ),),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(12, 3, 12, 5),
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            textAlign: TextAlign.right,
            '2025-07-14 23:32:04 478149',
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
