import 'package:flutter_location_app/data/repository/review_repository.dart';
import 'package:flutter_location_app/model/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//1. 상태 클래스 만들기
class ReviewState {
  List<Review> location;

  ReviewState(this.location);
}

//2. 뷰모델 만들기 - Notifier상속
class ReviewViewModel extends Notifier<ReviewState> {

  @override
  ReviewState build() {
    return ReviewState([]);
  }

  Future<void> searchLocation(String x, String y) async {
    final reviewRepository = ReviewRepository();
    final reviews = await reviewRepository.getByLocation(x, y);
    state = ReviewState(reviews);
  }
}

//3. 뷰모델 관리자 만들기
final reviewViewModelProvider = NotifierProvider<ReviewViewModel, ReviewState>(() {
  return ReviewViewModel();
});
