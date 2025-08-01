import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/detail_page/widgets/bottom_review_text_box.dart';
import 'package:flutter_location_app/ui/detail_page/widgets/review_item.dart';
import 'package:flutter_location_app/ui/detail_page/widgets/review_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget{
  final String x;
  final String y;
  final String title;
  DetailPage({required this.x, required this.y, required this.title});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();

    // 뷰모델에서 좌표 기반 리뷰 검색 실행
    Future.microtask(() {
      ref.read(reviewViewModelProvider.notifier).searchLocation(widget.x, widget.y);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reviewViewModelProvider);
    final reviews = state.location;

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
            widget.title,
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
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                String title = reviews[index].content;
                String time = reviews[index].createdAt;
                return reviewItem(title, time);
              },
            ),
          ),
        ),
        bottomSheet: BottomReviewTextBox(x: widget.x, y: widget.y),
      ),
    );
  }
}
