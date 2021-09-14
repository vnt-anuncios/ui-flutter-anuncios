import 'package:anuncios_ui/app/global/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Obx(
        () => (controller.loading)
            ? Loading()
            : Container(
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
                                  controller.user != null
                                      ? controller.user!.foto
                                      : "https://randomuser.me/api/portraits/men/46.jpg",
                                ),
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
                                    nombre: controller.user != null
                                        ? controller.user?.name ?? ""
                                        : "",
                                    onChange: (value) =>
                                        controller.onChangeNombre(value),
                                  ),
                                  divider,
                                  TextFieldProfile(
                                    icon: Icons.person,
                                    hinttext: "Apellido",
                                    nombre: controller.user != null
                                        ? controller.user?.apellido ?? ""
                                        : "",
                                    onChange: (value) =>
                                        controller.onChangeApellido(value),
                                  ),
                                  divider,
                                  TextFieldProfile(
                                    icon: Icons.calendar_today,
                                    hinttext: "Fecha de Nacimiento",
                                    nombre: controller.user != null
                                        ? controller.user!.fecha_nacimiento !=
                                                null
                                            ? controller.user!
                                                        .fecha_nacimiento !=
                                                    null
                                                ? controller
                                                    .user!.fecha_nacimiento!
                                                    .toIso8601String()
                                                    .split('T')
                                                    .first
                                                : ""
                                            : ""
                                        : "",
                                    onChange: (value) => controller
                                        .onChangeFechaNacimiento(value),
                                  ),
                                  divider,
                                  TextFieldProfile(
                                    icon: Icons.location_on,
                                    hinttext: "Ubicación",
                                    nombre: controller.user != null
                                        ? controller.user!.ubicacion ?? ""
                                        : "",
                                    onChange: (value) =>
                                        controller.onChangeUbicacion(value),
                                  ),
                                  divider,
                                  TextFieldProfile(
                                    enableText: false,
                                    icon: Icons.email,
                                    hinttext: "Correo Electronico",
                                    nombre: controller.user != null
                                        ? controller.user!.email
                                        : "",
                                    onChange: (value) =>
                                        print("onchange email"),
                                  ),
                                  divider,
                                  TextFieldProfile(
                                    icon: Icons.phone,
                                    hinttext: "Numero Telefono",
                                    nombre: controller.user != null
                                        ? controller.user!.telefono ??
                                            "Ingrese un número telefono"
                                        : "No se pudo recuperar sus datos",
                                    onChange: (value) =>
                                        print("onchange numero"),
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
                        onPressed: () {
                          controller.onSave();
                        },
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
      inputFormatters: [
        LengthLimitingTextInputFormatter(20),
      ],
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
