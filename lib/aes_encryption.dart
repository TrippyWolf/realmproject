import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class AesEncryption {
  final iv = IV.fromBase64("MTIzNDU2Nzg5MTAxMTEyMQ=="); //1234567891011121
  final key = Key.fromBase64("cHJpbmNlYWdhcndhbDEyMw=="); //princeagarwal123

  String encryptedData(String data) {
    data = base64.encode(utf8.encode(data));
    final encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
    ));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return Uri.encodeComponent(encrypted.base64);
  }
}
