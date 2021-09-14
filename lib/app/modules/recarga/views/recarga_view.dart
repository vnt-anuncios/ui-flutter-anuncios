import 'package:anuncios_ui/app/global/text_global.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/recarga_controller.dart';

class RecargaView extends GetView<RecargaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Créditos',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormat(text: "Créditos", size: 12.5.sp),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              TextFormat(text: "0", size: 12.5.sp),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormat(text: "Reservados", size: 12.sp),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              TextFormat(text: "0", size: 12.sp),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 30.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: TextFormat(
                        text: "Recargar",
                        size: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(
                          child: TextFormat(
                            text: "Mis Recargas",
                            size: 12.sp,
                          ),
                        ),
                        Tab(
                          child: TextFormat(
                            text: "Últimos movimientos",
                            size: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            child: Center(
                              child: SizedBox(
                                width: 80.w,
                                child: TextFormat(
                                  text:
                                      "No haz comprado crédito 😢 \n RECARGA! 😊",
                                  size: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: SizedBox(
                                width: 80.w,
                                child: TextFormat(
                                  text: "No haz gastado créditos",
                                  size: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
