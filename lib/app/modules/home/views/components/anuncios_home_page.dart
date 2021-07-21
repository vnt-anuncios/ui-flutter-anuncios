import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class AnunciosHomePage extends StatelessWidget {
  const AnunciosHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        //physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.3.h),
        scrollDirection: Axis.vertical,

        itemBuilder: (context, index) {
          return SizedBox(
            height: 17.h,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    _buildImage(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Container(
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 1.w,
                                child: IconButton(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border_outlined),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "19.65465 BS",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11.sp,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "titulo del producto asdfasdf  asdfasdf ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.grey.shade400,
                                                  size: 12.sp,
                                                ),
                                                Text(
                                                  "localidad",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: EdgeInsets.all(0),
                                          alignment: Alignment.centerRight,
                                          height: 5.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                    FontAwesomeIcons.whatsapp),
                                                label: Text("Contactar"),
                                              ),
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(Icons.phone_android),
                                                label: Text("LLamar"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        shrinkWrap: true,
        itemCount: 20,
      ),
    );
  }

  Container _buildImage() {
    return Container(
      width: 30.w,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/img/c.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 1.h,
            left: 1.w,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 13.sp,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    "5",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
