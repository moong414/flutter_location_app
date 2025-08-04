import 'package:flutter_location_app/data/repository/vworld_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final vWorldRepository = VWorldRepository();

  test('VWorldRepository : findByLatLng', () async {
    final result = await vWorldRepository.findByLatLng(
      lat: 35.2202216,
      lng: 129.0823133,
    );
    print('결과 1: $result'); // 👈 출력 추가
    expect(result.first, '부산광역시 동래구 온천동');

    final result2 = await vWorldRepository.findByLatLng(
      lat: 32.2202216,
      lng: 129.0823133,
    );
    print('결과 2: $result2'); // 👈 출력 추가
    expect(result2.length, 0);
  });
}
