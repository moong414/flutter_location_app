import 'package:flutter_location_app/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태만들기 => List<String> 사용
// 2. 뷰모델 만들기
class AddressViewModel extends AutoDisposeNotifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  final vWorldRepository = VWorldRepository();

  Future<void> searchByAddress(double lat, double lng) async {
     final result = await vWorldRepository.findByLatLng(lat: lat, lng: lng);
      print('검색 결과: $result');  // 여기에 로그 찍기
      state = result;
  }
}

// 3. 뷰모델 관리자 만들기
final addressViewModel =
    NotifierProvider.autoDispose<AddressViewModel, List<String>>(
        () => AddressViewModel());
