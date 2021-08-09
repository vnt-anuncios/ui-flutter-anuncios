import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recarga_controller.dart';

class RecargaView extends GetView<RecargaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecargaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RecargaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
