import 'dart:ui';

import 'package:app_pets/consts/utils.dart';
import 'package:test/test.dart';

// suite Color
void main() {
  const startCol = Color(0xFFe6ca19);
  test('Increase color bright by 0.2', () {
    const expectedCol = Color(0xFFf0df75);
    Color col = startCol.changeBrightBy(0.2);
    expect(col, equals(expectedCol));
  }, tags: 'petsapp');
  test('Decrease color bright by 0.2', () {
    const expectedCol = Color(0xFF8a790f);
    Color col = startCol.changeBrightBy(-0.2);
    expect(col, equals(expectedCol));
  });
  test('Increase color bright to more than 1', () {
    const expectedCol = Color(0xFFffffff);
    Color col = startCol.changeBrightBy(0.6);
    expect(col, equals(expectedCol));
  });
  test('decrease color bright to less than 0', () {
    const expectedCol = Color(0xFF000000);
    Color col = startCol.changeBrightBy(-0.6);
    expect(col, equals(expectedCol));
  });
}
