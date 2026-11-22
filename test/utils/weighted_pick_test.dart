import 'package:flutter_test/flutter_test.dart';
import 'package:theuniversedecides/utils/weighted_pick.dart';

void main() {
  group('totalWeight', () {
    test('sums every weight', () {
      expect(totalWeight([1, 3, 2]), 6);
      expect(totalWeight([]), 0);
    });
  });

  group('weightedIndexForTicket', () {
    test('maps each ticket to the item owning that weight range', () {
      const weights = [2, 1, 3];

      final indexes = [
        for (var ticket = 0; ticket < 6; ticket++)
          weightedIndexForTicket(weights, ticket),
      ];

      expect(indexes, [0, 0, 1, 2, 2, 2]);
    });

    test('equal weights map tickets one to one', () {
      expect(weightedIndexForTicket([1, 1, 1], 2), 2);
    });

    test('clamps out-of-range tickets to the last or first item', () {
      expect(weightedIndexForTicket([1, 1], 9), 1);
      expect(weightedIndexForTicket([1, 1], -1), 0);
    });
  });
}
