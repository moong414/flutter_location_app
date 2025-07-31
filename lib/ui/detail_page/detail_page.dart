import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/detail_page/widgets/bottom_review_text_box.dart';
import 'package:flutter_location_app/ui/detail_page/widgets/review_item.dart';

class DetailPage extends StatelessWidget {
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
          centerTitle: true,
          title: Text(
            '부산 광역시청',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff36495B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return reviewItem();
              },
            ),
          ),
        ),
        bottomSheet: bottomReviewTextBox(),
      ),
    );
  }
}
