import 'dart:io';

verifyPlatform() {
  if (Platform.isIOS) {
    return 1;
  } else {
    return 0;
  }
}
