class Review {
  String content;
  String createdAt;
  String mapx;
  String mapy;
  
  Review({
    required this.content,
    required this.createdAt,
    required this.mapx,
    required this.mapy,
  });

  //1. fromJson 네임드 생성자 만들기
  Review.fromJson(Map<String, dynamic> map)
    : this(
        content: map['content'],
        createdAt: map['createdAt'],
        mapx: map['mapx'],
        mapy: map['mapy'],
      );

  //2. toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'createdAt': createdAt,
      'mapx': mapx,
      'mapy': mapy,
    };
  }
}
