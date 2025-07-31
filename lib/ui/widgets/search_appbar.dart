import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/home_page/widgets/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const SearchAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  ConsumerState<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends ConsumerState<SearchAppbar> {
  //텍스트컨트롤러
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    //TextEditingController 사용시에는 반드시 dispose호출해줘야 메모리에서 소거됨!
    textEditingController.dispose();
    super.dispose();
  }

  //검색기능
  void onSearch(String text) {
    print("검색어: $text");
    ref.read(homeViewModelProvider.notifier).searchLocation(text);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffE5F4FF),
      title: Container(
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: TextField(
          maxLines: 1,
          onChanged: onSearch,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: '어디로 갈까요?',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
            border: InputBorder.none,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xff37495B),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Color(0x26000000),
                  offset: Offset(2, 2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Icon(Icons.gps_fixed, color: Colors.white),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
