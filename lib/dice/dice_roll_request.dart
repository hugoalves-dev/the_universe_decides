class DiceRollRequest {
  static final _termPattern = RegExp(r'([1-9]\d{0,4})d(4|6|8|10|12|20|100)');

  DiceRollRequest({
    required this.requestId,
    required this.notation,
    required List<int> results,
  }) : results = List.unmodifiable(results) {
    final matches = _termPattern.allMatches(notation).toList();
    if (matches.isEmpty || matches.map((match) => match.group(0)).join('+') != notation) {
      throw ArgumentError.value(notation, 'notation', 'Invalid dice notation');
    }

    var resultOffset = 0;
    final invalidResults = matches.any((match) {
      final count = int.parse(match.group(1)!);
      final sides = int.parse(match.group(2)!);
      if (count > 10000 || resultOffset + count > results.length) return true;
      final group = results.skip(resultOffset).take(count);
      resultOffset += count;
      return group.any((result) => result < 1 || result > sides);
    });
    if (invalidResults || resultOffset != results.length) {
      throw ArgumentError.value(results, 'results', 'Invalid dice results');
    }
  }

  final String requestId;
  final String notation;
  final List<int> results;

  Map<String, Object> toJson() {
    if (results.length > 10) {
      final firstTerm = _termPattern.firstMatch(notation)!;
      final sides = firstTerm.group(2)!;
      return {
        'requestId': requestId,
        'notation': '1d$sides',
        'results': [results.first],
      };
    }
    return {'requestId': requestId, 'notation': notation, 'results': results};
  }
}
