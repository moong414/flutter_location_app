import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/detail_page/widgets/review_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomReviewTextBox extends ConsumerStatefulWidget {
  String x;
  String y;
  BottomReviewTextBox({required this.x, required this.y});

  @override
  ConsumerState<BottomReviewTextBox> createState() =>
      _BottomReviewTextBoxState();
}

class _BottomReviewTextBoxState extends ConsumerState<BottomReviewTextBox> {
  //텍스트 컨트롤러
  late final contentController = TextEditingController();
  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: contentController,
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
                    VerticalDivider(indent: 15, endIndent: 15, width: 1),
                    GestureDetector(//리뷰등록
                      onTap: () async {
                        final content = contentController.text.trim();
                        if (content.isEmpty) return;
                        final reviewViewModel = ref.read(
                          reviewViewModelProvider.notifier,
                        );
                        final success = await reviewViewModel.insert(
                          content: content,
                          createdAt: DateTime.now().toIso8601String(),
                          mapx: widget.x,
                          mapy: widget.y,
                        );
                        if (success) {
                          contentController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('리뷰가 등록되었습니다.')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('리뷰 등록에 실패했습니다.')),
                          );
                        }
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
}
