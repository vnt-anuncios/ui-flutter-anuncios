import 'dart:ui';

import 'package:anuncios_ui/app/global/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Mi Perfil',
          style: TextStyle(),
        ),
        shadowColor: Colors.white38,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 155.0,
                  alignment: Alignment.bottomCenter,
                  child: ClipOval(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/user.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: userLogin.nombre,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          onChanged: (value) {},
                          autocorrect: true,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 19,
                              ),
                              hintText: 'Nombre',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        Divider(
                          color: Colors.white,
                          height: 3,
                        ),
                        TextFormField(
                          initialValue: userLogin.apellido,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          onChanged: (value) {},
                          autocorrect: true,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person,
                                size: 19,
                                color: Colors.white,
                              ),
                              hintText: "Apellido",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        Divider(
                          color: Colors.white,
                          height: 3,
                        ),
                        TextFormField(
                          initialValue: userLogin.fechaNacimiento,
                          onChanged: (value) {},
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          autocorrect: true,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                size: 19,
                                color: Colors.white,
                              ),
                              hintText: "Fecha de Nacimiento",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        Divider(
                          color: Colors.white,
                          height: 3,
                        ),
                        TextFormField(
                          initialValue: userLogin.email,
                          onChanged: (value) {},
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                size: 19,
                                color: Colors.white,
                              ),
                              hintText: "Correo Electrónico",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        Divider(
                          color: Colors.white,
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                height: 40.0,
                minWidth: 200.0,
                onPressed: () {},
                color: Colors.green,
                child: Text(
                  'Guardar Cambios',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
