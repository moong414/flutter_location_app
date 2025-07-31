//  {
//       "title": "<b>조선옥</b>",
//       "link": "",
//       "category": "한식>육류,고기요리",
//       "description": "",
//       "telephone": "",
//       "address": "서울특별시 중구 을지로3가 229-1",
//       "roadAddress": "서울특별시 중구 을지로15길 6-5",
//       "mapx": "1269934389",
//       "mapy": "375667917"
//     }

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
    title: map['title'],
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
