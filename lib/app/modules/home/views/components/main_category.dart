import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class MainCategoria extends StatelessWidget {
  final List<CategoriaItem> items;
  const MainCategoria({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.5.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
        shrinkWrap: true,
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemCard(
            items: items[index],
            onPress: () {
              print(items[index].title);
            },
          );
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.items,
    required this.onPress,
  }) : super(key: key);

  final CategoriaItem items;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        child: Container(
          width: 22.w,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        items.svgAssets,
                        width: 10.w,
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: Text(
                    items.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriaItem {
  final String title;
  final String svgAssets;
  CategoriaItem({required this.title, required this.svgAssets});
}
