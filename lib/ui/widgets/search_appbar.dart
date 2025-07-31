import 'package:flutter/material.dart';

AppBar homepageAppbar() {
  return AppBar(
    backgroundColor: Color(0xffE5F4FF),
    title: Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            offset: Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: '어디로 갈까요?',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {},
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff37495B),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000),
                offset: Offset(2, 2),
                blurRadius: 2,
              ),
            ],
          ),
          child: Icon(Icons.gps_fixed, color: Colors.white),
        ),
      ),
      SizedBox(width: 20),
    ],
  );
}
