import 'package:flutter/material.dart';

Container bottomReviewTextBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    decoration: BoxDecoration(
      color: Color(0xff36495B),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: SafeArea(
      child: Stack(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.fromLTRB(20, 5, 60, 0),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                hintText: '리뷰를 작성해주세요',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                border: InputBorder.none,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  VerticalDivider(indent: 15, endIndent: 15, width: 1,),
                  GestureDetector(
                    onTap: () {
                      print('ontap!');
                    },
                    child: Container(
                      width: 56,
                      height: 60,
                      color: Colors.transparent,
                      child: Icon(
                        Icons.play_arrow,
                        size: 24,
                        color: Color(0xff37495b),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
