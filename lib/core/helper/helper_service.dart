import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class HelperServices {
  static String hashPassword(String password) {
    var bytes = utf8.encode("foobar"); // data being hashed
    var digest = sha1.convert(bytes);
    return digest.toString();
  }
}
