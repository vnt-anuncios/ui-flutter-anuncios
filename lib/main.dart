import 'package:anuncios_ui/app/data/services/local/local_categoria_service.dart';
import 'package:anuncios_ui/app/utils/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/services.Dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependencyInjection.init();
  await Get.find<LocalCategoriaService>().cargarCategoria();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // status
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        theme: ThemeData(
          dividerTheme: DividerThemeData(
            thickness: 1.sp,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.green,
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 1,
            iconTheme: IconThemeData(
              color: Colors.green,
              size: 12.sp,
            ),
          ),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.green,
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.green,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            alignLabelWithHint: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.green,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Colors.green),
            ),
            hintStyle: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade400,
            ),
            labelStyle: TextStyle(color: Colors.green),
          ),
          accentColor: Colors.greenAccent,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
