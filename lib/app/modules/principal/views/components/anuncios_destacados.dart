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
          return Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              child: SizedBox(
                width: 40.w,
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          /*SvgPicture.asset(
                            "assets/img/login.svg",
                            height: 17.h,
                            fit: BoxFit.fill,
                          ),*/
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 0.75),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "assets/img/c.jpg",
                              height: 17.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "99.6564 bs",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Venta de login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 12.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Barrio san agustin asdfasdf ",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    etiqueta(
                      text: "Destacado",
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Positioned etiqueta(
      {required String text, required Color color, required Color textColor}) {
    return Positioned(
        left: 0,
        top: 1.h,
        child: Container(
          //height: 2.h,
          padding: EdgeInsets.all(3),
          color: color,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 8.sp,
              ),
            ),
          ),
        ));
  }
}
