import 'package:anuncios_ui/app/global/card_destacado.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnunciosDestacados extends StatelessWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  AnunciosDestacados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2.w),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        //shrinkWrap: true,
        itemBuilder: (context, index) {
          return CardDestacado();
        },
      ),
    );
  }

  
}
