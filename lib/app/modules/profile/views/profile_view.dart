import 'package:anuncios_ui/app/global/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    var divider = Divider(
      color: Colors.grey.shade400,
      height: 3,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.green,
            size: 18.sp,
          ),
        ),
        title: Text(
          'Mi perfil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 23.h,
                  child: Center(
                    child: SizedBox(
                      width: 50.w,
                      height: double.infinity,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/46.jpg",
                        ),
                        /*child: Image.network(
                          "https://randomuser.me/api/portraits/men/46.jpg",
                          fit: BoxFit.fill,
                        ),*/
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFieldProfile(
                            icon: Icons.person,
                            hinttext: "Nombre",
                            nombre: userLogin.nombre,
                            onChange: (value) => print("on change nombre"),
                          ),
                          divider,
                          TextFieldProfile(
                            icon: Icons.person,
                            hinttext: "Apellido",
                            nombre: userLogin.apellido,
                            onChange: (value) => print("onchange apellido"),
                          ),
                          divider,
                          TextFieldProfile(
                            icon: Icons.calendar_today,
                            hinttext: "Fecha de Nacimiento",
                            nombre: userLogin.fechaNacimiento,
                            onChange: (value) =>
                                print("onchange fecha de nacimiento"),
                          ),
                          divider,
                          TextFieldProfile(
                            icon: Icons.email,
                            hinttext: "Correo Electronico",
                            nombre: userLogin.email,
                            onChange: (value) => print("onchange email"),
                          ),
                          divider,
                          TextFieldProfile(
                            icon: Icons.phone,
                            hinttext: "Numero Telefono",
                            nombre: userLogin.numero,
                            onChange: (value) => print("onchange numero"),
                            enableText: false,
                          ),
                          divider,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
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

class TextFieldProfile extends StatelessWidget {
  final String nombre;
  final String hinttext;
  final IconData icon;
  final ValueChanged onChange;
  final bool enableText;
  const TextFieldProfile({
    Key? key,
    required this.nombre,
    required this.hinttext,
    required this.icon,
    required this.onChange,
    this.enableText: true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: nombre,
      style: TextStyle(
        color: enableText ? Colors.black : Colors.grey.shade400,
      ),
      onChanged: onChange,
      autocorrect: true,
      keyboardType: TextInputType.name,
      enabled: enableText,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        prefixIcon: Icon(
          icon,
          color: enableText ? Colors.green : Colors.grey.shade400,
          size: 16.sp,
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        labelStyle: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }
}
