import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_location_app/model/review.dart';

class ReviewRepository {
  // 1. insert 구현하기
  Future<bool> insert({
    required String content,
    required String createdAt,
    required String mapx,
    required String mapy,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      // 컬렉션 레퍼런스 타입의 이름이 기억이 안나요! 혹은 매번 타입 치기 번거로워요! 할땐 final or var!!!
      final collectionRef = firestore.collection('reviews');
      // 새로운 문서를 생성할거니 id 비우고 문서참조 생성!
      final docRef = collectionRef.doc();

      // 생성할 데이터 만들기!
      final map = {
        'content': content,
        'createdAt': DateTime.now().toIso8601String(),
        'mapx': mapx,
        'mapy': mapy,
      };
      // 저장!
      await docRef.set(map);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //x좌표, y좌표로 리뷰 구해오기
  Future<List<Review>> getByLocation(String x, String y) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('reviews');

      final querySnapshot = await collectionRef
          .where('mapx', isEqualTo: x)
          .where('mapy', isEqualTo: y)
          .get();

      final docs = querySnapshot.docs;

      return docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Review.fromJson(data);
      }).toList();
    } catch (e) {
      print('리뷰 가져오기 실패: $e');
      return [];
    }
  }
}
