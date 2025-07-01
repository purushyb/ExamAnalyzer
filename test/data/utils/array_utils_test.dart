// test/utils/array_utils_test.dart
import 'package:exam_analyzer/data/utils/array_utils.dart';
import 'package:flutter_test/flutter_test.dart'; // Or 'package:test/test.dart;' for pure Dart

void main() {
  group('ArrayUtils.circularArrayIndex', () {
    test(
      'should return correct index for positive accessIndex within bounds',
      () {
        expect(ArrayUtils.circularArrayIndex(4, 0), 0);
        expect(ArrayUtils.circularArrayIndex(4, 1), 1);
        expect(ArrayUtils.circularArrayIndex(4, 2), 2);
        expect(ArrayUtils.circularArrayIndex(4, 3), 3);
      },
    );

    test(
      'should return correct index for positive accessIndex exceeding bounds (circular)',
      () {
        expect(ArrayUtils.circularArrayIndex(4, 4), 0); // 4 % 4 = 0
        expect(ArrayUtils.circularArrayIndex(4, 5), 1); // 5 % 4 = 1
        expect(ArrayUtils.circularArrayIndex(4, 42), 2); // 42 % 4 = 2
        expect(ArrayUtils.circularArrayIndex(10, 11), 1); // 11 % 10 = 1
        expect(ArrayUtils.circularArrayIndex(10, 19), 9); // 19 % 10 = 9
        expect(ArrayUtils.circularArrayIndex(10, 20), 0); // 20 % 10 = 0
      },
    );

    test('should handle arrayLen of 1 correctly', () {
      expect(ArrayUtils.circularArrayIndex(1, 0), 0);
      expect(ArrayUtils.circularArrayIndex(1, 1), 0);
      expect(ArrayUtils.circularArrayIndex(1, 100), 0);
      expect(ArrayUtils.circularArrayIndex(1, -1), 0); // -1 % 1 = 0
      expect(ArrayUtils.circularArrayIndex(1, -5), 0); // -5 % 1 = 0
    });

    test('should throw IntegerDivisionByZeroException for arrayLen of 0', () {
      expect(
        () => ArrayUtils.circularArrayIndex(0, 5),
        throwsA(isA<IntegerDivisionByZeroException>()),
      );
      expect(
        () => ArrayUtils.circularArrayIndex(0, 0),
        throwsA(isA<IntegerDivisionByZeroException>()),
      );
      expect(
        () => ArrayUtils.circularArrayIndex(0, -1),
        throwsA(isA<IntegerDivisionByZeroException>()),
      );
    });
  });
}
