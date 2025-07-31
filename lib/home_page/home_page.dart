import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_location_app/home_page/widgets/search_item.dart';
import 'package:flutter_location_app/widgets/search_appbar.dart';
import 'package:flutter_location_app/home_page/widgets/homepage_title.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffE5F4FF),
        appBar: homepageAppbar(),
        body: Stack(
          children: [
            Column(
              children: [
                homepageTitle(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        return searchItem();
                      },
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
