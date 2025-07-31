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
    return HomeState([
      Location(title: "조선옥",
      link: "",
      category: "한식>육류,고기요리",
      description: "",
      telephone: "",
      address: "서울특별시 중구 을지로3가 229-1",
      roadAddress: "서울특별시 중구 을지로15길 6-5",
      mapx: "1269934389",
      mapy: "375667917"),
    ]);
  }
  // @override
  // HomeState build() {
  //   return HomeState([]);
  // }

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
