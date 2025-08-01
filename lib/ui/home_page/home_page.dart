import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_location_app/ui/home_page/widgets/home_view_model.dart';
import 'package:flutter_location_app/ui/home_page/widgets/search_item.dart';
import 'package:flutter_location_app/ui/widgets/search_appbar.dart';
import 'package:flutter_location_app/ui/home_page/widgets/homepage_title.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffE5F4FF),
        appBar: SearchAppbar(),
        body: Stack(
          children: [
            Column(
              children: [
                homepageTitle(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: homeState.location.length,
                      itemBuilder: (context, index) {
                        final location = homeState.location[index];
                        return SearchItem(location: location, index: index,);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 8,
              top: 15,
              child: Image.asset('assets/images/img_homepage_stack.png'),
            ),
          ],
        ),
      ),
    );
  }
}
