import 'package:flutter/material.dart';
import 'package:flutter_location_app/model/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_location_app/ui/detail_page/detail_page.dart';
import 'package:flutter_location_app/ui/home_page/widgets/home_view_model.dart';

class SearchItem extends ConsumerWidget {
  final Location location;
  final int index;
  const SearchItem({Key? key, required this.location, required this.index})
    : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(location.mapx, location.mapy);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(bottom: 20),
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
                location.category,
                style: TextStyle(
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text(location.title, style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(location.address, style: TextStyle(fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}
