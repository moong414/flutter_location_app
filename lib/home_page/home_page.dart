import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffE5F4FF),
        appBar: AppBar(
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
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '간편하게 검색하세요!',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff36495b),
                        ),
                      ),
                      Text('우리 지역 검색 앱', style: TextStyle(fontSize: 22, color: Color(0xff36495b), fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
        
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 8,
              top: 15,
              child: Image.asset('assets/images/img_homepage_stack.png'),
            ),
          ],
        ),
      ),
    );
  }
}
