import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_location_app/model/review.dart';

class ReviewRepository {
  Future<List<Review>> getAll() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // 컬렉션 레퍼런스 타입의 이름이 기억이 안나요! 혹은 매번 타입 치기 번거로워요! 할땐 final or var!!!
    final collectionRef = firestore.collection('reviews');
    final snapshot = await collectionRef.get();
    final documentSnaphots = snapshot.docs;
    // List의 map 을 호출하면 MappedIterable 클래스가 리턴됨
    // list -> MappedIterable : 내가가진 자료를 가공할건데 가공할 방식(함수) 던저줄게 잘 가지고 있어!
    final iterable = documentSnaphots.map((e) {
      final map = {
        'id': e.id, // id는 없기 때문에 직접 가공
        ...e.data(),
      };
      return Review.fromJson(map);
    });

    // MappedIterable야! 내가 주문한 방식으로 리스트 가공해!
    final list = iterable.toList();
    return list;
  }

  // 1. insert 구현하기
  Future<bool> insert({
    required String id,
    required String content,
    required String mapX,
    required String mapY,
    required String createdAt,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      // 컬렉션 레퍼런스 타입의 이름이 기억이 안나요! 혹은 매번 타입 치기 번거로워요! 할땐 final or var!!!
      final collectionRef = firestore.collection('reviews');
      // 새로운 문서를 생성할거니 id 비우고 문서참조 생성!
      final docRef = collectionRef.doc();

      // 생성할 데이터 만들기!
      final map = {
        'title': id,
        'content': content,
        'mapx': mapX,
        'mapy': mapY,
        'createdAt': DateTime.now().toIso8601String(),
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
  Future<Review?> getOne(String x, String y) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionRef = firestore.collection('reviews');

      //문서 가져오기
      final querySnapshot = await collectionRef
          .where('mapx', isEqualTo: x)
          .where('mapy', isEqualTo: y)
          .get();

      //가공하기
      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        final data = doc.data() as Map<String, dynamic>;
        return Review.fromJson(data);
      } else {
        return null; // 찾는 리뷰 없음
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
