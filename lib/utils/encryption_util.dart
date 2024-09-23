import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  static const _storage = FlutterSecureStorage();

  // Retrieve or generate the encryption key
  static Future<Key> getKey() async {
    String? storedKey = await _storage.read(key: 'encryption_key');
    if (storedKey == null) {
      final key = Key.fromSecureRandom(32);
      await _storage.write(key: 'encryption_key', value: base64UrlEncode(key.bytes));
      return key;
    } else {
      // Decode the stored key
      return Key(base64Url.decode(storedKey));
    }
  }

  // Encrypts a plain text string
  static String encryptString(String plainText, Key key) {
    final encrypt = Encrypter(AES(key, mode: AESMode.cbc));
    final iv = IV.fromSecureRandom(16);
    final encrypted = encrypt.encrypt(plainText, iv: iv);
    // Prepend IV to the encrypted data, separated by ':'
    return '${base64UrlEncode(iv.bytes)}:${encrypted.base64}';
  }

  // Decrypts an encrypted string
  static String decryptString(String encryptedText, Key key) {
    final parts = encryptedText.split(':');
    if (parts.length != 2) {
      throw const FormatException('Invalid encrypted text format');
    }
    final iv = IV(base64Url.decode(parts[0]));
    final encrypted = Encrypted.fromBase64(parts[1]);
    final encrypt = Encrypter(AES(key, mode: AESMode.cbc));
    return encrypt.decrypt(encrypted, iv: iv);
  }
}
