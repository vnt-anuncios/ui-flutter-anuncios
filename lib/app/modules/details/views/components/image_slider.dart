import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageSlider extends StatefulWidget {
  final List<Foto> images;
  ImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: listImage(widget.images),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            enlargeCenterPage: true,
            viewportFraction: 1,
            height: 26.h,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 2.w,
                height: 2.w,
                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<Widget> listImage(List<Foto> images) {
    if (images.isEmpty)
      return [
        Image.asset(
          "assets/img/image_not_found.png",
          fit: BoxFit.fill,
        )
      ];
    return images
        .map(
          (item) => Container(
            //margin: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: [
                  FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: "assets/img/loading.gif",
                    image: item.enlace,
                    width: 100.w,
                  ),
                  // Image.network(
                  //   item.enlace,
                  //   fit: BoxFit.fill,
                  //   width: 100.w,
                  // ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        "No. ${widget.images.indexOf(item) + 1}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
