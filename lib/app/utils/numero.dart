class Numero {
  static String urlWhatsApp = "whatsapp://send?phone=";
  static String mensaje = "&text=";
  static String llamar = "tel:";
}

String urlWhatssap({required String numero, String mensaje = ""}) {
  return Numero.urlWhatsApp + numero + Numero.mensaje + mensaje;
}

String llamar({required String numero}) {
  return Numero.llamar + numero;
}
