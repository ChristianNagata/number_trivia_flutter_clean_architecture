import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/domain/entities/number_trivia.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(text: 'Test text', number: 1);

  test('should be a subclass of NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the Json number is an int',
        () async {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('trivia_int.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, tNumberTriviaModel);
    });

    test(
        'should return a valid model when the Json number is regarded as a double',
        () async {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('trivia_double.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a Json map', () async {
      final result = tNumberTriviaModel.toJson();
      expect(result, isA<Map<String, dynamic>>());
    });

    test('should return a Json map containing the proper data', () async {
      final result = tNumberTriviaModel.toJson();
      final expectedMap = {
        "text": "Test text",
        "number": 1,
      };

      expect(result, expectedMap);
    });
  });
}
