import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_location_app/data/repository/location_repository.dart';
import 'package:flutter_location_app/model/location.dart';

//1. 상태 클래스 만들기
class HomeState {
  List<Location> location;

  HomeState(this.location);
}

//2. 뷰모델 만들기 - Notifier상속
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  Future<void> searchLocation(String query) async {
    final locationRepository = LocationRepository();
    final location = await locationRepository.searchLocation(query);
    state = HomeState(location);
  }
}

//3. 뷰모델 관리자 만들기
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
