import 'package:html/parser.dart' as htmlParser;


class Location {
  String title;
  String link;
  String category;
  String description;
  String telephone;
  String address;
  String roadAddress;
  String mapx;
  String mapy;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  //1. fromJson 네임드 생성자 만들기
  Location.fromJson(Map<String, dynamic> map) : this(
    title: htmlParser.parse(map['title']).body?.text ?? '',
    link: map['link'],
    category: map['category'],
    description: map['description'],
    telephone: map['telephone'],
    address: map['address'],
    roadAddress: map['roadAddress'],
    mapx: map['mapx'],
    mapy: map['mapy'],
  );

  //2. toJson 메서드 만들기
  Map<String, dynamic> toJson(){
    return{
      'title': title,
      'link': link,
      'category': category, 
      'description' : description, 
      'telephone': telephone,
      'address': address,
      'roadAddress':  roadAddress,
      'mapx': mapx,
      'mapy' : mapy,
    };
  }
}
