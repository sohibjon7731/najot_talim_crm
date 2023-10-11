import 'dart:io';

void clearTerminal() {
  if (Platform.isWindows) {
    // Windows uchun terminalni tozalash
    print("\x1B[2J\x1B[0;0H");
  } else {
    // Windows emas operatsion tizimlarda terminalni tozalash
    print("\x1B[2J");
  }
}