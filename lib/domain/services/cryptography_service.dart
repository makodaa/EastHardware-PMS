import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class CryptographyService {
  const CryptographyService();

  Uint8List hashPasswordBytes(List<int> bytes) {
    final digest = sha256.convert(bytes);
    return Uint8List.fromList(digest.bytes);
  }
}
